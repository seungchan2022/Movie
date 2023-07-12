import Foundation
import UIKit

struct MovieListEffector {
  
  let navigator: NavigatorType
  let diContainer: DIContainerType
}


extension MovieListEffector {
  var routeToDiscover: () -> Void {
    {
      navigator.push(
        featureName: Link.discoverList.rawValue,
        items: ["itemList": "네비게이터를 통해 보여질 페이지"],
        isAnimation: true)
    }
  }
  
  func getItemList(callback: @escaping ([MovieListViewModel.State.ScopeItem]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      callback([
        .init(
          imageURL: .none,
          title: "영화 이름",
          date: .init(),
          rate: 3.5,
          summary: "영화 줄거리"),
      ])
    }
  }
}
