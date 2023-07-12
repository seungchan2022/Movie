import Foundation
import UIKit

struct MyListsListEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension MyListsListEffector {
  // 디테일 페이지
  
  // 영화 데이터
  func getItemList(callback: @escaping ([MyListsListViewModel.State.ScopeItem]) -> Void) {
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
