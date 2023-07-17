import Foundation
import SwiftUI

struct DiscoverListRouteBuilder: FeatureBuildType {
  var featureName: String {
    Link.discoverList.rawValue
  }
  
  func build(items: [String : String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController {
    
    // my lists에서 위시리스트랑 씬리스트 구분 할때 사용 가능?
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
  fileprivate func getValue(Key: String) -> String? {
    first(where:  { $0.key == Key })?.value
  }
}
