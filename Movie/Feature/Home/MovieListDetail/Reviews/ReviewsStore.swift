import Foundation
import UIKit
import Platform

final class ReviewsStore: ObservableObject, Store {

  @Published var state: State
  let effector: ReviewsEffector
  
  init(
    initialState state: State,
    effector: ReviewsEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, ReviewsEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
        
      case .loadItem:
        newState.fetchReviewData.isLoading = true
        Task {
          print("load review bbb")
//          await self.send(effector.itemList(state.movieItemID))
          await self.send(effector.review(state.movieItemID))
        }
        print("load review aaa")
        return newState

      case .fetchReview(let result):
        print("fetch reviw ccc")
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
        
      case .throwError(let error):
        print(error.errorDescription ?? "")
        return newState
      }
    }
  }
}

extension ReviewsStore {
  struct State: Equatable {
    let movieItemID: String // movieid
    var isLoading: Bool = false

    var fetchReviewData: FetchData<MovieAPIModel.Detail.Review.Response?> = .init(value: .none)
  }
  
  enum Action: Equatable {
    case loadItem
    
    case fetchReview(Result<MovieAPIModel.Detail.Review.Response, CompositeError>)
    
    case onChangeLoading(Bool)
    case throwError(CompositeError)
    
  }
}

// 우리가 화면에 불러올 데이터
//extension ReviewsStore.State {
//  struct ScopeItem: Equatable, Identifiable {
////    let id: Int // review page의 무비 아이디
////    let authorId: String  // results안에 각 review의 id
//    let id: String  // author Id
////    let movieID: Int  // 넘겨진 movie id
//    let author: String
//    let content: String
//  }
//}

