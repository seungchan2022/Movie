import Foundation
import SwiftUI

struct MovieListDetailPageRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.movieListDetail.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    return UIHostingController(
      rootView: MovieListDetailPage(
        viewStore: .init(
          initialState: .init(
            movieItemID: items.getValue(key: "movieItemID")),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}

extension [String: String] {
  fileprivate func getValue(key: String) -> String {
    first(where: { $0.key == key })?.value ?? ""
  }
}
