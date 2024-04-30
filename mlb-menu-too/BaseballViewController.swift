import Cocoa

class BaseballViewController: NSViewController {
  @IBOutlet var tableView: NSTableView!
  
  var startedLoading: Bool = false
  var scoreboard = Scoreboard()
  
  // should use AppKit `representedObject`?
  var status: Scoreboard.Status = .idle {
    didSet {
      tableView.reloadData()
      updateSize()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    updateSize()
  }

  public func startLoading() {
    guard startedLoading == false else { return }
    startedLoading = true
    status = .loading
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
    let contentSize = NSSize(width: view.frame.width, height: tableView.intrinsicContentSize.height + 8)
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
      if let loadingView = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
        loadingView.textField?.stringValue = "Loading..."
        return loadingView
      }

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
        baseballView.leadingLogoView.image = game?.teams.away.info.logo
        baseballView.trailingLogoView.image = game?.teams.home.info.logo
        baseballView.textField?.stringValue = game?.summary ?? "ERROR"
        return view
      }
    }
    
    return nil // but how??
  }
}

extension Response.Game {
  var summary: String { "\(teams.away.info.initials) @ \(teams.home.info.initials)" }
}

class BaseballGameCellView: NSTableCellView {
  @IBOutlet var leadingLogoView: NSImageView!
  @IBOutlet var trailingLogoView: NSImageView!
}
