import Foundation
import SwiftUI

struct DirectorPageRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.director.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
  
    return UIHostingController(
      rootView: DirectorPage(
        viewModel: .init(
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}
