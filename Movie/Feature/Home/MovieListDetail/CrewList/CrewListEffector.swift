import Foundation
import UIKit
import Platform

struct CrewListEffector {
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension CrewListEffector {
  var crew: (String) async -> CrewListStore.Action {
    { movieID in
      do {
        let item = try await diContainer.creditAPI.getCrewTask(movieID)
        return .fetchCrew(.success(item))
      } catch {
        print("CrewList error ", error)
        return .fetchCrew(.failure(error.serialized()))
      }
    }
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

