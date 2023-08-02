import Foundation
import SwiftUI

struct CastListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.castList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    guard let container = diContainer as? UseCaseDIContainer else { return .init() }
    
    return UIHostingController(
      rootView: CastListPage(
        viewStore: .init(
          initialState: .init(movieItemID: items.getValue(key: "movieItemID")),
          effector: .init(
            navigator: navigator,
            diContainer: container))))
  }
}
