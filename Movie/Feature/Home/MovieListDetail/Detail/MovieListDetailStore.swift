import Foundation
import Platform
import UIKit

final class MovieListDetailStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: MovieListDetailEffector
  
  init(
    initialState state: State,
    effector: MovieListDetailEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, MovieListDetailEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onTapReview:
        await effector.routeToReviews(newState.movieItemID)
        return newState
        
      case .onTapCastList:
        await effector.routeToCastList(newState.movieItemID)
        return newState
        
      case .onTapDirector:
        await effector.routeToDirector(newState.movieItemID)
        return newState
        
      case .onTapCrewList:
        await effector.routeToCrewList(newState.movieItemID)
        return newState
        
      case .onTapSimilarList:
        await effector.routeToSimilarList(newState.movieItemID)
        return newState
        
      case .onTapRecommendList:
        await effector.routeToRecommendList(newState.movieItemID)
        return newState
        
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
                
      case .loadItem:
        newState.fetchMovieData.isLoading = true
        newState.fetchReviewData.isLoading = true
        newState.fetchReviewData.isLoading = true
        newState.fetchCastData.isLoading = true
        newState.fetchSimilarData.isLoading = true
        newState.fetchRecommendData.isLoading = true
        Task {
          await self.send([
            effector.movieDetail(state.movieItemID),
            effector.reviewDetail(state.movieItemID),
            effector.castDetail(state.movieItemID),
            effector.crewDetail(state.movieItemID),
            effector.similarDetail(state.movieItemID),
            effector.recommendDetail(state.movieItemID)
          ])
        }
        return newState
        
      case .fetchMovie(let result):
        newState.fetchMovieData.isLoading = false
        switch result {
        case .success(let item):
          newState.fetchMovieData.value = item
          return newState
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
        
      case .fetchReview(let result):
        newState.fetchReviewData.isLoading = false
        switch result {
        case .success(let item):
          newState.fetchReviewData.value = item
          return newState
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
        
      case .fetchCast(let result):
        newState.fetchCastData.isLoading = false
        switch result {
        case .success(let item):
          newState.fetchCastData.value = item
          return newState
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
        
      case .fetchCrew(let result):
        newState.fetchCrewData.isLoading = false
        switch result {
        case .success(let item):
          newState.fetchCrewData.value = item
          return newState
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
        
      case .fetchSimilar(let result):
        newState.fetchSimilarData.isLoading = false
        switch result {
        case .success(let item):
          newState.fetchSimilarData.value = item
          return newState
          
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
        
      case .fetchRecommend(let result):
        newState.fetchRecommendData.isLoading = false
        switch result {
        case .success(let item):
          newState.fetchRecommendData.value = item
          return newState
          
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
        
      case .throwError(let error):
        print(error.errorDescription ?? "")
        return newState
        }
    }
  }
}

extension MovieListDetailStore {
  struct State: Equatable {
    let movieItemID: String
    var isLoading: Bool = false
    
    var fetchMovieData: FetchData<MovieAPIModel.Detail.Movie.Response?> = .init(value: .none)
    var fetchReviewData: FetchData<MovieAPIModel.Detail.Review.Response?> = .init(value: .none)
    var fetchCastData: FetchData<MovieAPIModel.Detail.Credit.Response?> = .init(value: .none)
    var fetchCrewData: FetchData<MovieAPIModel.Detail.Credit.Response?> = .init(value: .none)
    var fetchSimilarData: FetchData<MovieAPIModel.Detail.Similar.Response?> = .init(value: .none)
    var fetchRecommendData: FetchData<MovieAPIModel.Detail.Recommend.Response?> = .init(value: .none)
  }
  
  enum Action: Equatable {
    case onTapReview
    case onTapCastList
    case onTapDirector
    case onTapCrewList
    case onTapSimilarList
    case onTapRecommendList
    
    case loadItem
    
    case fetchMovie(Result<MovieAPIModel.Detail.Movie.Response, CompositeError>)
    case fetchReview(Result<MovieAPIModel.Detail.Review.Response, CompositeError>)
    case fetchCast(Result<MovieAPIModel.Detail.Credit.Response, CompositeError>)
    case fetchCrew(Result<MovieAPIModel.Detail.Credit.Response, CompositeError>)
    case fetchSimilar(Result<MovieAPIModel.Detail.Similar.Response, CompositeError>)
    case fetchRecommend(Result<MovieAPIModel.Detail.Recommend.Response, CompositeError>)

    case onChangeLoading(Bool)
    case throwError(CompositeError)
  }
}

//extension MovieListDetailStore.State {
//  struct ScopeItem: Equatable, Identifiable {
//
//    let id: Int
//    let title: String
//    //    let imageURL: UIImage?
//    let imageURL: String
//    let releaseDate: String
//    let runningTime: Int
//    let status: String
//    let country: [String]
//    let voteAverage: Double
//    let voteCount: Int
//    let geners: [String]
////    let reviews: String
//    let overview: String
//    let keywords: [String]
//    let director: String
//  }
//}


