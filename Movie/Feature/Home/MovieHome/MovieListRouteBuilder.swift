import Foundation
import SwiftUI

struct MovieListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.movieList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    guard let container = diContainer as? UseCaseDIContainer else { return .init() }
    
    return UIHostingController(
      rootView: MovieListPage(
        viewStore: .init(
          initialState: .init(),
          effector: .init(
            navigator: navigator,
            diContainer: container))))
  }
}
