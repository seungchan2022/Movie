import Foundation
import SwiftUI
import DesignSystem

struct MyListsListPage {
  @ObservedObject var viewStore: MyListsListStore
  @State private var isActionSheetShowing = false
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
              .foregroundColor(AppColor.Label.base3)
          }
        }
      }
      
      Section {
        HStack(spacing: 0) {
          Spacer()
          Button(action: { viewStore.send(.loadWishItemList) }) {
            Text("Wishlist")
            
          }
          .frame(width: 150, height: 30)
          .background(state.showType == .wishList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
          .cornerRadius(10)
          
          Button(action: { viewStore.send(.loadSeenItemList) }) {
            Text("Seenlist")
          }
          .frame(width: 150, height: 30)
          .background(state.showType == .seenList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
          .cornerRadius(10)
          Spacer()
        }
        .font(.system(size: 14, weight: .medium))
        .buttonStyle(.plain)
      } // wishlist, seenlist 버튼
      
      
      if state.showType == .wishList {
        Section(header: Text("\(state.wishItemList.count) MOVIES IN WISHLIST (BY RELEASE DATE)")) {
          ForEach(state.wishItemList, id: \.title) { item in
            WishListComponent(
              viewState: .init(item: item),
              tapAction: {  viewStore.send(.onSelectDetailItem($0))})
            .frame(height: 160)
            .padding(.vertical, 8)
          }
        }
      } else if state.showType == .seenList {
        Section(header: Text("\(state.seenItemList.count) MOVIES IN SEENLIST (BY RELEASE DATE)")) {
          ForEach(state.seenItemList, id: \.title) { item in
            SeenListComponent(
              viewState: .init(item: item),
              tapAction: {  viewStore.send(.onSelectDetailItem($0)) })
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
    .navigationBarTitleDisplayMode(.large)
    .navigationTitle("My Lists")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { isActionSheetShowing = true }) {
          Image(systemName: "line.3.horizontal.decrease.circle")
        }
      }
    }
    .confirmationDialog(
      "Sort movies by",
      isPresented: $isActionSheetShowing,
      titleVisibility: .visible)
    {
      Button("Sort by added date", role: .none, action: { print("Did tap sort by added date") })
      
      Button("Sort by release date", role: .none, action: { print("Did tap sort by release date") })
      
      Button("Sort by ratings", role: .none, action: { print("Did tap sort by ratings") })
      
      Button("Sort by popularity", role: .none, action: { print("Did tap sort by popularity") })
      
      Button("Cancel", role: .cancel, action: { print("Cancel")})
    }
    .onAppear {
      viewStore.send(.loadWishItemList)
    }
  }
}

