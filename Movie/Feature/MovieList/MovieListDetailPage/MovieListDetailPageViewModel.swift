import Foundation
import UIKit

final class MovieListDetailPageViewModel: ObservableObject {
  
  @Published var state: State
  private let effector: MovieListDetailPageEffector
  
  init(
    initialState: State,
    effector: MovieListDetailPageEffector)
  {
    self.state = initialState
    self.effector = effector
  }
  
  func send(action: ViewAction) {
    switch action {
    case .onTapReviews:
      effector.routeToReviews()
      return
      
    case .onTapCastList:
      effector.routeToCastList()
      return
      
    case .onTapDirector:
      effector.routeToDirector()
      return
    }
    
    
  }
}

extension MovieListDetailPageViewModel {
  struct State: Equatable {
    
  }
  
  enum ViewAction: Equatable {
    case onTapReviews
    case onTapCastList
    case onTapDirector
  }
}

extension MovieListDetailPageViewModel.State {
  struct ScopeItem: Equatable {
    let title: String
    let imageURL: UIImage?
    let year: String
    let runningTime: Int
    let release: String
    let rate: Double
    let comments: Int
  }
}

