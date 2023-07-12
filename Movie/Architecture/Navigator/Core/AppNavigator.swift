import UIKit
import SwiftUI

struct TabNavigator {
  let tabName: String
  let defaultFeatureName: String
  let defaultItems: [String : String]
  let defaultImage: UIImage?
  let diContainer: DIContainerType
  let featureBuilderList: [FeatureBuildType]
  private let rootNavigation = UINavigationController()
  
  init(
    tabName: String,
    defaultFeatureName: String,
    defaultItems: [String : String] = [:],
    defaultImage: UIImage? = .none,
    diContainer: DIContainerType,
    featureBuilderList: [FeatureBuildType])
  {
    self.tabName = tabName
    self.defaultFeatureName = defaultFeatureName
    self.defaultItems = defaultItems
    self.defaultImage = defaultImage
    self.diContainer = diContainer
    self.featureBuilderList = featureBuilderList
  }
}

extension TabNavigator: NavigatorType {

  func launch(featureName: String, items: [String : String]) -> UIViewController {
    let pick = buildViewController(featureName: featureName, items: items)
    rootNavigation.setViewControllers([pick].compactMap { $0 }, animated: false)
    return rootNavigation
  }
  
  func push(featureName: String, items: [String : String], isAnimation: Bool) {
    guard let pick = buildViewController(featureName: featureName, items: items)
    else { return }
    rootNavigation.pushViewController(pick, animated: isAnimation)
  }
  
  func back(isAnimation: Bool) {
    rootNavigation.popViewController(animated: isAnimation)
  }
}

extension TabNavigator {
  private func buildViewController(featureName: String, items: [String: String]) -> UIViewController? {
    featureBuilderList
      .first(where: { $0.featureName == featureName })?
      .build(
        items: items,
        diContainer: diContainer,
        navigator: self)
  }
}
