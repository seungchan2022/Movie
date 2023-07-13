import Foundation
import SwiftUI

struct ReviewsRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.reviews.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    return UIHostingController(
      rootView: ReviewsPage(
        viewModel: .init(
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}
