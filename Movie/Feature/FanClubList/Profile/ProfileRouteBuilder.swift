import Foundation
import SwiftUI

struct ProfileRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.profile.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    return UIHostingController(
      rootView: ProfilePage(
        viewModel: .init(
          initialState: .init(),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}
