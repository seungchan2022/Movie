import Foundation
import SwiftUI

struct DiscoverListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.discoverList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    let itemList = items.getValue(Key: "itemList")
    
    return UIHostingController(
      rootView: DiscoverListPage(
        viewModel: .init(
          initialState: .init(
            itemList: itemList ?? "",
            tempList: itemList ?? ""),
          effector: .init(
            navigator: navigator,
            diContainer: diContainer))))
  }
}

extension [String: String] {
  func getValue(Key: String) -> String? {
    first(where:  { $0.key == Key })?.value
  }
}
