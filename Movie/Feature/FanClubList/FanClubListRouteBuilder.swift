import Foundation
import SwiftUI

struct FanClubListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.fanClubList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    return UIHostingController(
      rootView: FanClubListPage(
        viewModel: .init(
          initialState: .init(),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}
