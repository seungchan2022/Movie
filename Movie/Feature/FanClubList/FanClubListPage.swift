import Foundation
import SwiftUI

struct FanClubListPage {
  @ObservedObject var viewModel: FanClubListViewModel
  @State private var scrollToTop = false
}

extension FanClubListPage {
  var state: FanClubListViewModel.State {
    viewModel.state
  }
}

extension FanClubListPage: View {
  var body: some View {
    VStack {
      List {
        Section {
          
          ForEach(state.profileList, id: \.name) { profile in
            HStack(spacing: 10) {
              Image(uiImage: profile.profileImageURL ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 120)
                .cornerRadius(10)
              
              VStack(alignment: .leading, spacing: 8) {
                Spacer()
                
                Text(profile.name)
                  .font(.system(size: 18, weight: .bold))
                Text(profile.work)
                  .font(.system(size: 14, weight: .medium))
                  .foregroundColor(.gray)
                
                Spacer()
              }
              
            }
            .frame(height: 120)
          }
          
        } header: {
          Text("POPULAR PEOPLE TO ADD TO YOUR FAN CLUB")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .background(Color.gray.opacity(0.3))
        }
      }
      .listStyle(.plain)
    }
    .navigationTitle("Fan Club")
    .navigationBarTitleDisplayMode(.large)
    .onAppear {
      viewModel.send(action: .loadProfileList)
    }
  }
}
