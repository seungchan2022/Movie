import Foundation
import SwiftUI

struct MovieListDetailPageRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.movieListDetail.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    return UIHostingController(
      rootView: MovieListDetailPage(
        viewModel: .init(
          initialState: .init(),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}

