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

  var cast: (String) async -> CastListStore.Action {
    { movieID in
      do {
        let item = try await diContainer.creditAPI.getCastTask(movieID)
        
        return .fetchCast(.success(item))
      } catch {
        print("Cast error ", error)
        return .fetchCast(.failure(error.serialized()))
      }
    }
  }
}

//extension MovieAPIModel.Detail.Credit.Response.Cast {
//  fileprivate var serialized: CastListStore.State.ScopeItem {
//    .init(
//      id: id, // cast id
//      name: name,
//      character: character,
//      profileImage: profileImage?.imagePath ?? ""
//    )
//  }
//}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

