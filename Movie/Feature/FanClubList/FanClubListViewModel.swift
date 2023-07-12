import Foundation
import UIKit

final class FanClubListViewModel: ObservableObject {
  
  @Published var state: State
  private let effector: FanClubListEffector
  
  init(
    initialState: State,
    effector: FanClubListEffector)
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

extension FanClubListViewModel {
  // 타이틀, 사람이름, 풀네임 => 누르면 그 사람에 대한 Detail페이지
  struct State: Equatable {
    var profileList: [State.ScopeItem] = []
  }
  
  enum ViewAction: Equatable {
    case loadProfileList
  }
}

extension FanClubListViewModel.State {
  struct ScopeItem: Equatable {
    let profileImageURL: UIImage?
    let name: String
    let work: String
  }
}
