import Foundation
import SwiftUI

struct FanClubListPage {
  @ObservedObject var viewModel: FanClubListViewModel
}

extension FanClubListPage {
  var state: FanClubListViewModel.State {
    viewModel.state
  }
}

extension FanClubListPage: View {
  var body: some View {
    VStack {
      Spacer()
      Text("Fan club list page")
      
      ScrollView {
        VStack {
          ForEach(state.profileList, id: \.name) { profile in
            Text(profile.name)
          }
        }
      }
      Spacer()
    }
    .onAppear {
      viewModel.send(action: .loadProfileList)
    }
  }
}
