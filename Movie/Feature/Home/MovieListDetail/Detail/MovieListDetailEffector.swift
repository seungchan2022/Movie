import Foundation
import UIKit
import Platform

struct MovieListDetailEffector {
  
  let navigator: NavigatorType
  let diContainer: UseCaseDIContainer
}

extension MovieListDetailEffector {
  @MainActor
  var routeToReviews: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.reviews.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }
  
  @MainActor
  var routeToCastList: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.castList.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }
  
  @MainActor
  var routeToDirector: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.director.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }
  
  @MainActor
  var routeToCrewList: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.crewList.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }
  
  @MainActor
  var routeToSimilarList: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.similarList.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }
  
  @MainActor
  var routeToRecommendList: (String) async -> Void {
    { id in
      navigator.push(
        featureName: Link.recommendList.rawValue,
        items: ["movieItemID": id],
        isAnimation: true)
    }
  }

  var movieDetail: (String) async -> MovieListDetailStore.Action {
    { movieID in
      do {
        let item = try await diContainer.movieDetailAPI.getDetailTask(movieID)
        print("AAA movieDetail")
        return .fetchMovie(.success(item))
      } catch {
        print("AAA error movieDetail ", error)
        return .fetchMovie(.failure(error.serialized()))
      }
    }
  }
  
  var reviewDetail: (String) async -> MovieListDetailStore.Action {
    { movieID in
      do {
        let item = try await diContainer.reviewAPI.getReviewTask(movieID)
        return .fetchReview(.success(item))
      } catch {
        print("AA Error review ", error)
        return .fetchReview(.failure(error.serialized()))
      }
    }
   }
  
  var castDetail: (String) async -> MovieListDetailStore.Action {
    { movieID in
      do {
        let item = try await diContainer.creditAPI.getCastTask(movieID)
        return .fetchCast(.success(item))
      } catch {
        print("AA Error cast ", error)
        return .fetchCast(.failure(error.serialized()))
      }
    }
  }
  
  var crewDetail: (String) async -> MovieListDetailStore.Action {
    { movieID in
      do {
        let item = try await diContainer.creditAPI.getCrewTask(movieID)
        return .fetchCrew(.success(item))
      } catch {
        print("AA Error crew ", error)
        return .fetchCast(.failure(error.serialized()))
      }
    }
  }
  
  var similarDetail: (String) async -> MovieListDetailStore.Action {
    { movieID in
      do {
        let item = try await diContainer.similarAPI.getSimilarTask(movieID)
        return .fetchSimilar(.success(item))
      } catch {
        print("AA Error similar ", error)
        return .fetchSimilar(.failure(error.serialized()))
      }
    }
  }
  
  var recommendDetail: (String) async -> MovieListDetailStore.Action {
    { movieID in
      do {
        let item = try await diContainer.recommendAPI.getRecommendTask(movieID)
        return .fetchRecommend(.success(item))
      } catch {
        print("AA Error recommend ", error)
        return .fetchRecommend(.failure(error.serialized()))
      }
    }
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

