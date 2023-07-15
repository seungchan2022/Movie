import Foundation
import UIKit

final class ProfileViewModel: ObservableObject {
  
  @Published var state: State
  private let effector: ProfileEffector
  
  init(
    initialState: State,
    effector: ProfileEffector)
  {
    self.state = initialState
    self.effector = effector
  }
  
  func send(action: ViewAction) {
    switch action {
    case .loadItemList:
      effector.getItemList { [weak self] itemList in
        self?.state.itemList = itemList
      }
      return
      
    case .onShowMovieDetail:
      effector.routeToMovieDetail()
    }
  }
}

extension ProfileViewModel {
  struct State: Equatable {
    var itemList: [State.ScopeItem] = []
  }
  
  enum ViewAction: Equatable {
    case loadItemList
    case onShowMovieDetail
  }
}

extension ProfileViewModel.State {
  struct ScopeItem: Equatable {
    let image: UIImage?
    let title: String
  }
}
