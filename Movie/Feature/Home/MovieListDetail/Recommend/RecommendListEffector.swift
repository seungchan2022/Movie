
import Foundation
import UIKit
import Platform

struct RecommendListEffector {
  
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension RecommendListEffector {
  @MainActor
  var routeToMovieDetailPage: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.movieListDetail.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }
//
//  @MainActor
//    var routeToMovieDetailPage: (Int) async -> Void {
//      { id in
//          navigator.push(
//            featureName: Link.movieListDetail.rawValue,
//            items: ["movieItemID": "\(id)"],
//            isAnimation: true)
//      }
//  }
    
  var itemList: (String) async -> RecommendListStore.Action {
    { movieID in
      do {
        let item = try await diContainer.recommendAPI.getRecommendTask(movieID)
        print("similar movie ", movieID)
        return .fetchItemList(.success(item))
      } catch {
        return .fetchItemList(.failure(error.serialized()))
      }
    }
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}


