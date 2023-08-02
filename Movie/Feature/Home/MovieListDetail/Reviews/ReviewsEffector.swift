import Foundation
import UIKit
import Platform

struct ReviewsEffector {
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension ReviewsEffector {
  
  @MainActor
  var itemList: (String) async -> ReviewsStore.Action {
    {
      do {
        let result = try await diContainer.reviewAPI.getReviewTask($0)
//        let list = result.itemList.map(\.serialized)
//        return .fetchItemList(list)
        return .fetchItemList([result.serialized])
      } catch {
        print("Review Error ", error)
        return .fetchItemList([])
      }
    }
  }
}

//extension MovieAPIModel.Detail.Review.Response.Item {
//  fileprivate var serialized: ReviewsStore.State.ScopeItem {
//    .init(
//      id: id,
//      author: author,
//      content: content
//      )
//  }
//}

extension MovieAPIModel.Detail.Review.Response {
  fileprivate var serialized: ReviewsStore.State.ScopeItem {
    .init(
      id: id,
      page: page)
  }
}
