import Foundation
import SwiftUI
import DesignSystem

struct MovieListDetailPage {
  @ObservedObject var viewStore: MovieListDetailStore
  @State private var wishListSelected = false
  @State private var seenListSelected = false
}

extension MovieListDetailPage {
  var state: MovieListDetailStore.State {
    viewStore.state
  }
}

extension MovieListDetailPage: View {
  var body: some View {
    List{
      if let selectedItem = state.itemList.first(where: { $0.id == state.movieItemID }) {
        Section {
          MovieCardComponent(
            viewState: .init(item: selectedItem))
          
//          .listRowBackground(Color(.systemBlue).opacity(0.2))
//          .listRowBackground(LinearGradient(gradient: Gradient(colors: [.black, .gray, .black]), startPoint: .leading, endPoint: .trailing))
          .listRowBackground(RadialGradient(colors: [.gray, .black], center: .center, startRadius: 0, endRadius: 270))

          
          VStack {  // wishlist, seenlist
            HStack {
              Button(action: {
                wishListSelected.toggle()
                seenListSelected = false
              }) {
                HStack(spacing: 2) {
                  if wishListSelected {
                    Image(systemName: "heart.fill")
                      .renderingMode(.template)
                    Text("In wishlist")
                      .font(.subheadline)
                      .fontWeight(.bold)
                  } else {
                    Image(systemName: "heart")
                      .foregroundColor(AppColor.Tint.primary)
                    Text("Wishlist")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(AppColor.Tint.primary)
                  }
                }
              }
              .frame(width: wishListSelected ? 120 : 100, height: 30, alignment: .center)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(wishListSelected ? Color(.clear) : AppColor.Tint.primary, lineWidth: 1)
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                      .fill(wishListSelected ? AppColor.Tint.primary : .clear)
                  )
              )
              
              Button(action: {
                wishListSelected = false
                seenListSelected.toggle()
              }) {
                HStack(spacing: 2) {
                  if seenListSelected {
                    Image(systemName: "eye.fill")
                      .renderingMode(.template)
                    Text("Seen")
                      .font(.subheadline)
                      .fontWeight(.bold)
                  } else {
                    Image(systemName: "eye")
                      .foregroundColor(AppColor.Tint.secondary)
                    Text("Seenlist")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(AppColor.Tint.secondary)
                  }
                }
              }
              .frame(width: seenListSelected ? 80 : 100, height: 30, alignment: .center)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(seenListSelected ? Color(.clear) : AppColor.Tint.secondary, lineWidth: 1)
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                      .fill(seenListSelected ? AppColor.Tint.secondary : .clear)
                  )
              )
              
              Button(action: {
                
              }) {
                HStack(spacing: 2) {
                  Image(systemName: "pin")
                  Text("List")
                }
              }
              .frame(width: 60, height: 30, alignment: .center)
              .foregroundColor(AppColor.Label.base)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(AppColor.Label.base, lineWidth: 1)
              )
              Spacer()
            }
            .buttonStyle(.plain)
          }
          .padding(.top, 10)
          
          // 솔직히 이거는 Component로 나누는게 맞나?
          // => 근데 다음과 같이 나누지 않고 이 상태로 이동은 어떻게....
          //          Text(selectedItem.reviews)
          //            .foregroundColor(Color(.systemMint))
          //            .onTapGesture {
          //              //              viewStore.send(.onTapReviews($0))
          //            }
          MovieReviewComponent(
            viewState: .init(item: selectedItem),
            tapAction: { viewStore.send(.onTapReviews($0)) })
          
          MovieOverviewComponent(viewState: .init(item: selectedItem))
        } // overview까지
        
        Section {
          MovieKeywordsComponent(viewState: .init(item: selectedItem)) // keyword
          
          MovieCastComponent(viewState: .init(item: selectedItem), tapAction: { viewStore.send(.onTapCastList($0))})
          
          MovieDirectorComponent(viewState: .init(item: selectedItem), tapAction: { viewStore.send(.onTapDirector($0))})
        }
      } // selectecItem
    }
    .navigationTitle(state.movieItemID)
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}

