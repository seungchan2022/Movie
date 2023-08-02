import Foundation
import UIKit
import Platform

struct MovieListDetailEffector {
  
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension MovieListDetailEffector {
  @MainActor
  var routeToReviews: (MovieListDetailStore.State.ScopeItem) -> Void {
    { item in
        navigator.push(
          featureName: Link.reviews.rawValue,
          items: ["movieItemID": "\(item.id)"],
          isAnimation: true)
    }
  }
  
  @MainActor
  var routeToCastList: (MovieListDetailStore.State.ScopeItem) -> Void {
    { item in
        navigator.push(
          featureName: Link.castList.rawValue,
          items: ["movieItemID": "\(item.id)"],
          isAnimation: true)
    }
  }
  
  @MainActor
  var routeToDirector: (MovieListDetailStore.State.ScopeItem) -> Void {
    { item in
        navigator.push(
          featureName: Link.director.rawValue,
          items: ["movieItemID": "\(item.id)"],
          isAnimation: true)
    }
  }
  
  @MainActor
  var itemList: (String) async -> MovieListDetailStore.Action {
    {
      do {
        let result = try await diContainer.movieDetailAPI.getDetailTask($0)
        return .fetchItemList([result.serialized])
      } catch {
        print("AA Error ", error)
        return .fetchItemList([])
      }
    }
  }
}

extension MovieAPIModel.Detail.Movie.Response {
  fileprivate var serialized:
    MovieListDetailStore.State.ScopeItem {
      .init(
        id: id,
        title: title,
        imageURL: posterPath?.imagePath ?? "",
        releaseDate: releaseDate, // 날짜
        runningTime: runtime, // 시간
        status: "Released",
//          status: status,
        country: productionCountries.map(\.name),
        voteAverage: voteAverage * 10,
        voteCount: voteCount,
        geners: genres.map(\.name),
        reviews: "reviews",
        overview: overView,
//        keywords: keywords.map(\.name),
//        keywords: keywords,
        keywords: ["ketwro", "dfdf"],
//        keywords: [],
        director: "")
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

