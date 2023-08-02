import Foundation
import SwiftUI

struct ReviewsRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.reviews.rawValue
  }
  
  @MainActor func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
   
    guard let container = diContainer as? UseCaseDIContainer else { return .init() }
    
    return UIHostingController(
      rootView: ReviewsPage(
        viewStore: .init(
          initialState: .init(
            movieItemID: items.getValue(key: "movieItemID")),
          effector: .init(
            navigator: navigator,
            diContainer: container))))
  }
}

