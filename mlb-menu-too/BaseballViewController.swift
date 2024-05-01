import Cocoa

extension BaseballViewController: NSMenuDelegate {
  func menuWillOpen(_ menu: NSMenu) {
    startLoading()
  }
}

class BaseballViewController: NSViewController {
  @IBOutlet var tableView: NSTableView!
  
  var startedLoading: Bool = false
  var scoreboard = Scoreboard()
  
  // should use AppKit `representedObject`?
  var status: Scoreboard.Status = .idle {
    didSet {
      tableView.reloadData()
      updateSize()
      startedLoading = false
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    updateSize()
  }

  public func startLoading() {
    guard startedLoading == false else { return }
    startedLoading = true
    if case .idle = status {
      status = .loading
    }
    fetchData()
  }

  func fetchData() {
    Task.detached {
      await self.scoreboard.fetch { [weak self] status in
        DispatchQueue.main.async { [weak self] in
          self?.status = status
        }
      }
    }
  }
  
  func updateSize() {
    let contentSize = NSSize(width: view.frame.width, height: tableView.intrinsicContentSize.height) // + 8)
    view.setFrameSize(contentSize)
  }
}

extension BaseballViewController: NSTableViewDataSource {
  func numberOfRows(in tableView: NSTableView) -> Int {
    if case .loaded = status { return scoreboard.games.count }
    return 1
  }
}

extension BaseballViewController: NSTableViewDelegate {
  func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
    print("should select row \(row) in \(tableView)?")
    return false
  }
    
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    switch status {
    case .loading:
      let identifier = NSUserInterfaceItemIdentifier("LoadingCell")
      guard let view = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView,
          let loadingView = view as? LoadingCellView else { return nil }
      loadingView.spinner.startAnimation(nil)
      return loadingView

    case .error:
      let identifier = NSUserInterfaceItemIdentifier("LoadingCell")
      if let loadingView = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
        loadingView.textField?.stringValue = "Error!"
        return loadingView
      }

    case .idle:
      let identifier = NSUserInterfaceItemIdentifier("LoadingCell")
      if let loadingView = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
        loadingView.textField?.stringValue = "Idle."
        return loadingView
      }

    case let .loaded(responseStatus):
      let game = responseStatus.dates.first?.games[row]
      let identifier = NSUserInterfaceItemIdentifier("TextCell")
      if let view = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
        guard let baseballView = view as? BaseballGameCellView else { return nil }
        baseballView.objectValue = game
        return view
      }
    }
    
    return nil // but how??
  }
}

extension Response.Team {
  var name: String { info.name }
}

extension Response.Game {
  var summary: String {
    if status.detailedState == "Scheduled" {
      if status.startTimeTBD { return "TBD" }
      return gameDate.formatted(date: .omitted, time: .shortened)
    }

    if let awayScore = teams.away.score, let homeScore = teams.home.score {
      return "\(awayScore) - \(homeScore)"
    }
    
    return "\(teams.away.info.initials) @ \(teams.home.info.initials)"
  }
}

class LoadingCellView: NSTableCellView {
  @IBOutlet var spinner: NSProgressIndicator!
}

class BaseballGameCellView: NSTableCellView {
  @IBOutlet var leadingLogoView: NSImageView!
  @IBOutlet var trailingLogoView: NSImageView!
  
  @IBOutlet var leadingScoreLabel: NSTextField!
  @IBOutlet var trailingScoreLabel: NSTextField!
  
  
  // @IBOutlet var segmentedControl: NSSegmentedControl!
  
  override var objectValue: Any? {
    didSet {
      guard let gameDate = objectValue as? Response.Game else { return }

      let tooltip = gameDate.tooltip
      leadingLogoView.toolTip = tooltip
      textField?.toolTip = tooltip
      trailingLogoView.toolTip = tooltip
      
      leadingScoreLabel.isHidden = true
      trailingScoreLabel.isHidden = true
      
      leadingLogoView.image = gameDate.teams.away.info.logo
      trailingLogoView.image = gameDate.teams.home.info.logo
      
      if gameDate.status.detailedState == "Scheduled" {
        if gameDate.status.startTimeTBD {
          textField?.stringValue = "TBD"
        } else {
          textField?.stringValue = gameDate.gameDate.formatted(date: .omitted, time: .shortened)
        }
      } else if gameDate.status.detailedState == "In Progress" {
        leadingScoreLabel.isHidden = false
        trailingScoreLabel.isHidden = false
        
        var inningString = "???"
        if let linescore = gameDate.linescore {
          inningString = [linescore.inningState.shortName, linescore.currentInningOrdinal].joined(separator: " ")
          // inningString = [( linescore.isTopInning ? "▲" : "▼" ), linescore.currentInningOrdinal].joined(separator: " ")
        }
        textField?.stringValue = inningString
        leadingScoreLabel.stringValue = gameDate.teams.away.score.map { "\($0)" } ?? "\(Int.random(in: 2...12))"
        trailingScoreLabel.stringValue = gameDate.teams.home.score.map { "\($0)" } ?? "\(Int.random(in: 2...12))"
      } else if gameDate.status.detailedState == "Game Over" || gameDate.status.detailedState == "Final" {
        leadingScoreLabel.isHidden = false
        trailingScoreLabel.isHidden = false
        textField?.stringValue = "Final"
        leadingScoreLabel.stringValue = gameDate.teams.away.score.map { "\($0)" } ?? "\(Int.random(in: 2...12))"
        trailingScoreLabel.stringValue = gameDate.teams.home.score.map { "\($0)" } ?? "\(Int.random(in: 2...12))"
      } else if gameDate.status.detailedState == "Pre-Game" || gameDate.status.detailedState == "Warmup" {
        textField?.stringValue = gameDate.gameDate.formatted(date: .omitted, time: .shortened)
      } else if gameDate.status.detailedState == "Delayed Start" {
        textField?.stringValue = "↻" + gameDate.gameDate.formatted(date: .omitted, time: .shortened)
      } else {
        textField?.stringValue = "WAT"
      }
    }
  }
}

extension Response.Game {
  var tooltip: String {
    return [
      teams.away.name,
    " vs ",
      teams.home.name,
    "\n",
      gameDate.formatted(date: .omitted, time: .shortened),
    " at ",
      venue.name
    ].joined()
  }
}
