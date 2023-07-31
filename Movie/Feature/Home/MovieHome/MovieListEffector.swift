import Foundation
import UIKit
import Platform

struct MovieListEffector {
  
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension MovieListEffector {
  @MainActor
  var routeToDiscover: () async -> Void {
    {
      navigator.push(
        featureName: Link.discoverList.rawValue,
        items: ["itemList": "네비게이터를 통해 보여질 페이지"],
        isAnimation: true)
    }
  }
  
  @MainActor
  var routeToMovieDetailPage: (MovieListStore.State.ScopeItem) async -> Void {
    { item in
        navigator.push(
          featureName: Link.movieListDetail.rawValue,
          items: ["movieItemID": "\(item.id)"],
          isAnimation: true)
    }
  }
  
  // 여기서 날리는 Int가 페이지 번호?
  // 페이지 번호를 날리면 그에 해당 하는 페이지가 나오는 구조?
  var itemList: (Int) async -> MovieListStore.Action {
    { page in
      do {
        let result = try await diContainer.movieAPI.getListTask(page)
        let list = result.itemList.map(\.serialized)
        return .fetchItemList(list)
      } catch {
        return .fetchItemList([])
      }
    }
  }
}

// 받아온 response의 해당하는 아이템들을 해당 페이지에 맞게 넣어주기 위해
extension MovieAPIModel.PlayList.Response.Item {
  fileprivate var serialized: MovieListStore.State.ScopeItem {
    .init(
      id: id,
      imageURL: posterPath?.imagePath ?? "",
      title: title,
      date: releaseDate,
      rate: voteAverage,
      summary: overView)
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}
