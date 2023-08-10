import Foundation
import SwiftUI

struct RecommendListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.recommendList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    guard let container = diContainer as? UseCaseDIContainer else { return .init() }
    
    return UIHostingController(
      rootView: RecommendListPage(
        viewStore: .init(
          initialState: .init(
            movieItemID: items.getValue(key: "movieItemID")),
          effector: .init(
            navigator: navigator,
            diContainer: container))))

  }
}
