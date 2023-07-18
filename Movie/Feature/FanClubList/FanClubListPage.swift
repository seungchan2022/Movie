import Foundation
import SwiftUI

struct FanClubListPage {
  @ObservedObject var viewStore: FanClubListStore
  @State private var scrollToTop = false
}

extension FanClubListPage {
  var state: FanClubListStore.State {
    viewStore.state
  }
}

extension FanClubListPage: View {
  var body: some View {
    VStack {
      List {
        Section {
          
          ForEach(state.itemList, id: \.name) { profile in
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
            .onTapGesture {
              viewStore.send(.onTapProfile)
            }
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
    .onAppear {
      viewStore.send(.loadProfileList)
    }
  }
}
