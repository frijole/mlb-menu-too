import Cocoa

class ViewController: NSViewController {
  @IBOutlet var tableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear() {
    super.viewWillAppear()
    
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
    return 10
  }
}

extension ViewController: NSTableViewDelegate {
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let identifier = NSUserInterfaceItemIdentifier("CellIdentifier")
    if let view = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
      view.textField?.stringValue = "Row \(row)"
      return view
    }
    return nil
  }
}
