import Foundation
import SwiftUI

struct MyListsListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.myListsList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    return UIHostingController(
      rootView: MyListsListPage(
        viewModel: .init(
          initialState: .init(),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}
