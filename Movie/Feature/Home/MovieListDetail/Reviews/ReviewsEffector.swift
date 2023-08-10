import Foundation
import UIKit
import Platform

struct ReviewsEffector {
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension ReviewsEffector {

  var review: (String) async -> ReviewsStore.Action {
    { movieID in
      do {
        let item = try await diContainer.reviewAPI.getReviewTask(movieID)
        print("aaa review")
        return .fetchReview(.success(item))
      } catch {
        print("aaa review error ", error)
        return .fetchReview(.failure(error.serialized()))
      }
    }
  }
}

