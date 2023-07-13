import Foundation
import SwiftUI

struct CastListPage {
  @ObservedObject var viewModel: CastListViewModel
}

extension CastListPage {
  var state: CastListViewModel.State {
    viewModel.state
  }
}

extension CastListPage: View {
  var body: some View {
    Text("Cast page")
    List{
      ForEach(state.profileList, id: \.name) { profile in
        HStack(spacing: 10) {
          Image(uiImage: profile.profileImage ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 80)
          
          VStack(alignment: .leading, spacing: 8) {
            Spacer()
            
            Text(profile.name)
              .font(.system(size: 18, weight: .bold))
            Text(profile.character)
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.gray)
            
            Spacer()
          }
          
        }
        .frame(height: 120)
      }
    }
    .onAppear {
      viewModel.send(action: .loadProfileList )
    }
  }
}
