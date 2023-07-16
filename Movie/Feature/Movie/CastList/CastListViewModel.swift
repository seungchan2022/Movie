import Foundation
import UIKit

final class CastListViewModel: ObservableObject {
  
  @Published var state: State
  private let effector: CastListEffector
  
  init(
    initialState: State,
    effector: CastListEffector)
  {
    self.state = initialState
    self.effector = effector
  }
  
  func send(action: ViewAction) {
    switch action {
    case .loadProfileList:
      effector.getProfileList { [weak self] profileList in
        self?.state.profileList = profileList
      }
      return
    }
  }
}

extension CastListViewModel {
  struct State: Equatable {
    var profileList: [State.ScopeItem] = []
  }
  
  enum ViewAction: Equatable {
    case loadProfileList
  }
}

extension CastListViewModel.State {
  struct ScopeItem: Equatable {
    let profileImage: UIImage?
    let name: String
    let character: String
  }
}
