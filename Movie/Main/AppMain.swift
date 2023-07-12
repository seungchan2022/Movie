import SwiftUI


@main
struct AppMain {
  @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
}

extension AppMain: App {
  var body: some Scene {
    WindowGroup {
      AppTabBarContainer(navigatorList: appDelegate.tabNavigationList)
    }
  }
}
