import Foundation
import UIKit
import Platform

struct CastListEffector {
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension CastListEffector {
  // 프로필 디테일 페이지
  
  // 프로필 데이터
  var itemList: (String) async -> CastListStore.Action {
    {
      do {
        let result = try await diContainer.creditAPI.getCreidtTask($0)
        return .fetchItemList([result.serialized])
      } catch {
        print("Cast error ", error)
        return .fetchItemList([])
      }
    }
  }
}

extension MovieAPIModel.Detail.Credit.Response {
  fileprivate var serialized: CastListStore.State.ScopeItem {
    .init(
      id: id,
      cast: cast.map(\.name)
    )
  }
}
