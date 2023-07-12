import UIKit

final class AppDelegate: NSObject {
  
  let diContainer = AppDIContainer()
  var tabNavigationList: [NavigatorType] {
    diContainer.production()
  }
}

extension AppDelegate: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
  {
    true
  }
}
