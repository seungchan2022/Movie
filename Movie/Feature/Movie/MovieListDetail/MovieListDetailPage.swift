import Foundation
import SwiftUI

struct MovieListDetailPage {
  @ObservedObject var viewStore: MovieListDetailStore
  @State private var wishListSelected = false
  @State private var seenListSelected = false
  @State private var isOverviewTapped = false
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
          VStack {
            HStack {
              Image(uiImage: selectedItem.imageURL ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 10))
              
              VStack {
                Spacer()
                
                Text("\(selectedItem.year) • ") +
                Text("\(selectedItem.runningTime) • ") +
                Text(selectedItem.release)
                
                Spacer()
                
                HStack(spacing: 5) {
                  Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color(.systemRed))
                  Text(String(format: "%.1f", selectedItem.rate))
                  Text("\(selectedItem.comments) ratings")
                  
                                  Spacer()
                }
                Spacer()
              }
              .font(.system(size: 16, weight: .medium))
              
            }
            
            HStack(spacing: 8) {
              Button(action: { print("액션")}) {
                HStack {
                  Text("액션")
                    .font(.system(size: 14, weight: .bold))
                  Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                }
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .background(
                  RoundedRectangle(cornerRadius: 15).stroke(Color(.gray), lineWidth: 2)
                )
              }
              
              Button(action: { print("범죄")}) {
                HStack {
                  Text("범죄")
                    .font(.system(size: 14, weight: .bold))
                  Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                }
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .background(
                  RoundedRectangle(cornerRadius: 15).stroke(Color(.gray), lineWidth: 2)
                )
              }
              
              Button(action: { print("스릴러")}) {
                HStack {
                  Text("스릴러")
                    .font(.system(size: 14, weight: .bold))
                  Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                }
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .background(
                  RoundedRectangle(cornerRadius: 15).stroke(Color(.gray), lineWidth: 2)
                )
              }
              Spacer()
            }
            .foregroundColor(Color(.label))
            .padding(.top, 12)
            .padding(.bottom, 12)
            
          } // vstack

          .listRowBackground(Color(.systemBlue).opacity(0.2))
        } // overview까지
        
        Section {
          Text("keyword")
          Text("cast")
          Text("director")
        }
      }
    }
    .navigationTitle(state.movieItemID)
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}
