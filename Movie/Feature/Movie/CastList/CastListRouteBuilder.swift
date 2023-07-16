import Foundation
import SwiftUI

struct CastListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.castList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    return UIHostingController(
      rootView: CastListPage(
        viewModel: .init(
          initialState: .init(),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}
