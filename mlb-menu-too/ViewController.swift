import Cocoa

class ViewController: NSViewController {
  @IBOutlet var tableView: NSTableView!
  
  var startedLoading: Bool = false
  var scoreboard = Scoreboard()
  
  // should use AppKit `representedObject`?
  var status: Scoreboard.Status = .idle {
    didSet {
      tableView.reloadData()
      updateWindowSize()
    }
  }

  override func viewWillAppear() {
    super.viewWillAppear()
    updateWindowSize()
  }
  
  override func viewDidAppear() {
    super.viewDidAppear()
    if startedLoading == false {
      startedLoading = true
      status = .loading
      fetchData()
    }
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
  
  func updateWindowSize() {
    let contentSize = NSSize(width: view.frame.width, height: tableView.intrinsicContentSize.height + 8)
    view.window?.setContentSize(contentSize)
  }
}

extension ViewController: NSTableViewDataSource {
  func numberOfRows(in tableView: NSTableView) -> Int {
    if case .loaded = status { return scoreboard.games.count }
    return 1
  }
}

extension ViewController: NSTableViewDelegate {
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
        view.textField?.stringValue = game?.summary ?? "GAME ERROR"
        return view
      }
    }
    
    return nil // but how??
  }
}

extension Response.Game {
  var summary: String { "\(teams.away.name.initials) @ \(teams.home.name.initials)" }
}
