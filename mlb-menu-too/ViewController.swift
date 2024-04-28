import Cocoa

class ViewController: NSViewController {
  @IBOutlet var tableView: NSTableView!
  
  var loading: Bool = true {
    didSet {
      tableView.reloadData()
      updateWindowSize()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear() {
    super.viewWillAppear()
    updateWindowSize()

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      self?.loading = false
    }
  }
  
  func updateWindowSize() {
    let contentSize = NSSize(width: view.frame.width, height: tableView.intrinsicContentSize.height + 8)
    view.window?.setContentSize(contentSize)
  }
  
  // should use AppKit `representedObject`?
  var gameData: Response? {
    didSet {
      tableView.reloadData()
    }
  }
}

extension ViewController: NSTableViewDataSource {
  func numberOfRows(in tableView: NSTableView) -> Int {
    loading ? 1 : 10
  }
}

extension ViewController: NSTableViewDelegate {
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    if loading {
      let identifier = NSUserInterfaceItemIdentifier("LoadingCell")
      if let loadingView = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
        return loadingView
      }
    }

    let identifier = NSUserInterfaceItemIdentifier("TextCell")
    if let view = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
      view.textField?.stringValue = "Row \(row)"
      return view
    }
    return nil
  }
}
