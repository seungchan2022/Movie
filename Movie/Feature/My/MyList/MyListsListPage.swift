import Foundation
import SwiftUI

struct MyListsListPage {
  @ObservedObject var viewStore: MyListsListStore
}

extension MyListsListPage {
  var state: MyListsListStore.State {
    viewStore.state
  }
  
  private var isShowSheet: Binding<Bool> {
    .init(
      get: { state.isShowSheet },
      set: { viewStore.send(.onChangeSheet($0)) })
  }
}

extension MyListsListPage: View {
  var body: some View {
    List {
      Section(header: Text("CUSTOM LISTS")) {
        if !state.isShowSheet {
          Button(action: { viewStore.send(.onChangeSheet(true)) }) {
            Text("Create Custom List")
              .font(.system(size: 18, weight: .medium))
              .frame(height: 30, alignment: .leading)
              .padding(.horizontal)
              .foregroundColor(Color(.systemMint).opacity(0.5))
          }
        }
      }
      
      Section(header: Text("List Type")) {
        HStack(spacing: 0) {
          Spacer()
          Button(action: { viewStore.send(.loadWishItemList) }) {
            Text("Wishlist")
          }
          .frame(width: 150, height: 30)
          .background(state.showType == .wishList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
          .foregroundColor(.white)
          .cornerRadius(10)
          
          Button(action: { viewStore.send(.loadSeenItemList) }) {
            Text("Seenlist")
          }
          .frame(width: 150, height: 30)
          .background(state.showType == .seenList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
          .foregroundColor(.white)
          .cornerRadius(10)
          Spacer()
        }
        .buttonStyle(.plain)
      }
      
      
        if state.showType == .wishList {
          Section(header: Text("\(state.wishItemList.count) MOVIES IN WISHLIST (BY RELEASE DATE)")) {
            ForEach(state.wishItemList, id: \.title) { item in
              HStack {
                Image(uiImage: item.imageURL ?? UIImage())
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 100, height: 160)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
                  .padding(.bottom, 8)
                
                VStack(alignment: .leading, spacing: 16) {
                  Text(item.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.yellow)
                  
                  HStack {
                    Image(systemName: "star.fill")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 16, height: 16)
                      .foregroundColor(Color(.systemRed))
                    
                    Text(String(format: "%.1f", item.rate))
                    
                    Text(item.date)
                  }
                  .font(.system(size: 16, weight: .medium))
                  .foregroundColor(.gray)
                  .lineLimit(1)
                  .minimumScaleFactor(0.5)
                  
                  
                  Text(item.summary)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .lineLimit(3)
                }
                Spacer()
              }
              .frame(height: 160)
              .padding(.vertical, 8)
            }
          }
        } else if state.showType == .seenList {
          Section(header: Text("\(state.seenItemList.count) MOVIES IN SEENLIST (BY RELEASE DATE)")) {
            ForEach(state.seenItemList, id: \.title) { item in
              HStack {
                Image(uiImage: item.imageURL ?? UIImage())
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 100, height: 160)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
                  .padding(.bottom, 8)
                
                VStack(alignment: .leading, spacing: 16) {
                  Text(item.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.yellow)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                  HStack {
                    Image(systemName: "star.fill")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 16, height: 16)
                      .foregroundColor(Color(.systemRed))
                    
                    Text(String(format: "%.1f", item.rate))
                    
                    Text(item.date)
                  }
                  .font(.system(size: 16, weight: .medium))
                  .foregroundColor(.gray)
                  
                  Text(item.summary)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .lineLimit(3)
                }
                Spacer()
              }
              .frame(height: 160)
              .padding(.vertical, 8)
            }
          }
        }
    }
    .listStyle(GroupedListStyle())
    .sheet(isPresented: isShowSheet) {
      CustomListsPage()
    }
    .navigationTitle("My Lists")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { print("Setting")}) {
          Image(systemName: "line.3.horizontal.decrease.circle")
        }
      }
    }
    .onAppear {
      viewStore.send(.loadWishItemList)
    }
  }
}

