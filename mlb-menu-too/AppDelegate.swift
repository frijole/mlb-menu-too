import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
  
  var statusItem: NSStatusItem?
  var baseballViewController: BaseballViewController!
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    guard let viewController = NSStoryboard(name: "Main", bundle: nil)
      .instantiateController(withIdentifier: "BaseballViewController") as? BaseballViewController else { return }
    baseballViewController = viewController
    
    let statusBar = NSStatusBar.system
    let statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
    statusBarItem.button?.title = "⚾️"

    let baseballMenu = NSMenu(title: "⚾️")
    statusBarItem.menu = baseballMenu
    baseballMenu.delegate = viewController

    let baseballMenuItem = NSMenuItem(title: "beisbol", action: nil, keyEquivalent: "")
    baseballMenuItem.view = viewController.view
    baseballMenu.addItem(baseballMenuItem)
    
    statusItem = statusBarItem
    
    viewController.startLoading()
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
