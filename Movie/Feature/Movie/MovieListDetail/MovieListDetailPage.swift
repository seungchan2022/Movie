import Foundation
import SwiftUI

struct MovieListDetailPage {
  @ObservedObject var viewStore: MovieListDetailStore
  @State private var wishListSelected = false
  @State private var seenListSelected = false
  @State private var isOverView = false
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
          
          .listRowBackground(Color(.systemBlue).opacity(0.2))
          
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
                      .foregroundColor(.white)
                    Text("In wishlist")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(.white)
                  } else {
                    Image(systemName: "heart")
                      .foregroundColor(Color(.systemRed))
                    Text("Wishlist")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(Color(.systemRed))
                  }
                }
              }
              .frame(width: wishListSelected ? 120 : 100, height: 30, alignment: .center)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(wishListSelected ? Color(.clear) : Color(.systemRed), lineWidth: 1)
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                      .fill(wishListSelected ? Color(.systemPink) : .clear)
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
                      .foregroundColor(.white)
                    Text("Seen")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(.white)
                  } else {
                    Image(systemName: "eye")
                      .foregroundColor(Color(.systemGreen))
                    Text("Seenlist")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(Color(.systemGreen))
                  }
                }
              }
              .frame(width: seenListSelected ? 80 : 100, height: 30, alignment: .center)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(seenListSelected ? Color(.clear) : Color(.systemGreen), lineWidth: 1)
                  .background(
                    RoundedRectangle(cornerRadius: 5)
                      .fill(seenListSelected ? Color(.systemGreen) : .clear)
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
              .foregroundColor(Color(.systemYellow))
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(Color(.systemYellow), lineWidth: 1)
              )
              Spacer()
            }
            .buttonStyle(.plain)
          }
          
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
          
          VStack(alignment: .leading, spacing: 8) {
            Text("Overview:")
              .font(.system(size: 16, weight: .bold))
            if isOverView {
              Text(selectedItem.overview)
              Text("Less")
                .foregroundColor(Color(.systemMint))
            } else {
              Text(selectedItem.overview)
                .lineLimit(2)
              Text("Read More")
                .foregroundColor(Color(.systemMint))
            }
          }
          .onTapGesture {
            isOverView.toggle()
          }
        } // overview까지
        
        Section {
          VStack(alignment: .leading, spacing: .zero) {
            Spacer()
            Text("keywords")
              .font(.system(size: 16, weight: .bold))
            ScrollView(.horizontal, showsIndicators: false) {
              LazyHStack(spacing: 12) {
                ForEach(0..<selectedItem.keywords.count) { index in
                  Button(action: {
                    print(selectedItem.keywords[index])
                  }) {
                    Text(selectedItem.keywords[index])
                      .font(.system(size: 14, weight: .bold))
                    Image(systemName: "chevron.right")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 10, height: 10)
                    
                  }
                }
                .foregroundColor(Color(.label))
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.gray).opacity(0.2)))
                Spacer()
              } // LazyHStack (keyword)
              
            }
          } // keyword
          
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

