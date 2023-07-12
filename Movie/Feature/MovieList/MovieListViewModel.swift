import Foundation
import UIKit

final class MovieListViewModel: ObservableObject {
  
  @Published var state: State
  private let effector: MovieListEffector
  
  init(
    initialState: State,
    effector: MovieListEffector)
  {
    self.state = initialState
    self.effector = effector
  }
  
  func send(action: ViewAction) {
    switch action {
    case .onTapDiscover:
      effector.routeToDiscover()
      return
      
    case .loadItemList:
      effector.getItemList { [weak self] itemList in
        self?.state.itemList = itemList
      }
      return
    }
  }
}

extension MovieListViewModel {
  struct State: Equatable {
    var itemList: [State.ScopeItem] = []
  }
  
  enum ViewAction: Equatable {
    case onTapDiscover
    case loadItemList
  }
}

extension MovieListViewModel.State {
  struct ScopeItem: Equatable {
    let imageURL: UIImage?
    let title: String
    let date: Date
    let rate: Double
    let summary: String
  }
}
