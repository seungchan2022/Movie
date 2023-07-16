import Foundation
import SwiftUI

struct MovieListPage {
  // 네비게이션 버튼을 눌렀을때 버튼 이미지가 달라지고 보이는 화면이 다르게 하기위해
  @State private var isButtonClicked = false
  @ObservedObject var viewStore: MovieListStore
  @FocusState private var isFocused
}

extension MovieListPage {
  private var state: MovieListStore.State {
    viewStore.state
  }
  
  private var filteredItems: [MovieListStore.State.ScopeItem] {
    if state.keyword.isEmpty {
      return state.itemList
    } else {
      return state.itemList.filter {
        $0.title.lowercased().contains(state.keyword.lowercased())
      }
    }
  }
  
  private var searchComponentViewState: SearchComponent.ViewState {
    .init(text: state.keyword)
  }
}

extension MovieListPage: View {
  
  var body: some View {
    ScrollView {
      // 서치
      VStack {
        SearchComponent(
          viewState: searchComponentViewState,
          textChangeAction: { viewStore.send(.onChangeKeyword($0)) })
        .padding(.horizontal, 8)
        
        VStack {
          ForEach(filteredItems, id: \.title) { item in
            MovieCardComponent(
              viewState: .init(item: item),
              tapAction: { viewStore.send(.onSelectedDetailItem($0)) })
          }
        }
      }
    }
    .navigationTitle("Now Playing")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { print("Setting")}) {
          Image(systemName:"wrench.adjustable")
        }
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { isButtonClicked.toggle() }) {
          Image(systemName: isButtonClicked ?  "rectangle.grid.1x2" : "rectangle.3.group.fill")
        }
      }
    }
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}
