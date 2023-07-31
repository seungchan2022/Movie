import Foundation
import Platform
import SwiftUI


struct MovieListDetailPageRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.movieListDetail.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    guard let container = diContainer as? UseCaseDIContainer else { return .init() }
        
    return UIHostingController(
      rootView: MovieListDetailPage(
        viewStore: .init(
          initialState: .init(
            movieItemID: items.getValue(key: "movieItemID")),
          effector: .init(
            navigator: navigator,
            diContainer: container))))
  }
}

extension [String: String] {
  func getValue(key: String) -> String {
    first(where: { $0.key == key })?.value ?? ""
  }
}
