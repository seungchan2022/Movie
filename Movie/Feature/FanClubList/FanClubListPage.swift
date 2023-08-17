import Foundation
import SwiftUI
import DesignSystem

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
    ScrollView {
      Text("test")
      VStack {
        Text("POPULAR PEOPLE TO ADD TO YOUR FAN CLUB")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(AppColor.Label.base2)
        LazyVStack {
          ForEach(state.itemList, id: \.name) { item in
            VStack {
              Button(action: { print(item.name)
                viewStore.send(.onTapProfile)
              }) {
                //              Divider()
                HStack {
                  Image(uiImage: item.profileImageURL ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 100)
                    .cornerRadius(10)
                  
                  VStack(alignment: .leading, spacing: 12) {
                    
                    Text(item.name)
                      .font(.system(size: 18, weight: .bold))
                      .foregroundColor(AppColor.Label.base)
                    Text(item.work)
                      .font(.system(size: 14, weight: .medium))
                      .multilineTextAlignment(.leading)
                      .foregroundColor(AppColor.Label.base2)
                  }
                  Spacer()
                  
                  Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundColor(AppColor.Label.base2)
                }
                .padding(12)
              }
              .foregroundColor(Color(.label))
            }
            Divider()
          }
        }
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(AppColor.Background.base)
        )
        .padding(.horizontal, 16)
      }
      .background(AppColor.Background.base2)
    }
    .navigationTitle("Fan Club")
    .onAppear {
      viewStore.send(.loadProfileList)
    }
  }
}
