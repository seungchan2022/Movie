import Foundation
import UIKit
import SwiftUI

struct AppTabBarContainer {
  let navigatorList: [NavigatorType]
}

extension AppTabBarContainer: UIViewControllerRepresentable {
  
  func makeUIViewController(context: Context) ->  UIViewController {
    let viewController = UITabBarController()
    let buildViewControllerList = build(navigatorList: navigatorList)
    viewController.setViewControllers(buildViewControllerList, animated: false)
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
  }
}

extension AppTabBarContainer {
  private func build(navigatorList: [NavigatorType]) -> [UIViewController] {
    navigatorList.enumerated().map { idx, navigator in
      let item = UITabBarItem(
        title: navigator.tabName,
        image: navigator.defaultImage,
        tag: idx)
      let viewController: UIViewController = navigator.launch(
        featureName: navigator.defaultFeatureName,
        items: navigator.defaultItems)
      viewController.tabBarItem = item
      return viewController
    }
  }
}
