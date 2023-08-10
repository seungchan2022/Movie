import Foundation
import SwiftUI
import DesignSystem

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
  
  private var isShowSheet: Binding<Bool> {
    .init(
      get: { state.isShowSheet },
      set: { viewStore.send(.onChangeSheet($0)) })
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
        
        LazyVStack {
          ForEach(filteredItems, id: \.title) { item in
            MovieCardComponent(
              viewState: .init(item: item),
              tapAction: { viewStore.send(.onSelectedDetailItem($0)) })
            // 무한 로딩 페이지
            .onAppear {
              guard let lasPick = filteredItems.last else { return }
              guard lasPick.id == item.id else { return }
              print("AA")
              viewStore.send(.loadItemList)
            }
            
            Divider()
          }
        }
      }
      .padding(.horizontal, 12)
      
    }
        .navigationTitle("Now playing")
        .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { viewStore.send(.onChangeSheet(true)) }) {
          Image(systemName:"wrench.adjustable")
            .foregroundColor(AppColor.Label.base)
        }
      }
    }
    .sheet(isPresented: isShowSheet) {
      SettingsPage()
    }
    
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { isButtonClicked.toggle() }) {
          Image(systemName: isButtonClicked ?  "rectangle.grid.1x2" : "rectangle.3.group.fill")
            .foregroundColor(AppColor.Label.base)
        }
      }
    }
    .setLoading(state.isLoading)
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}

extension View {
  @ViewBuilder
  func setLoading(_ isLoading: Bool) -> some View {
    ZStack {
      self
      if isLoading {
        VStack {
          Spacer()
          ProgressView()
          Text("로딩중 입니다...")
            .frame(maxWidth: .infinity)
          Spacer()
        }
        // 로딩중에 화면을 건드리지 못하게 하기 위해 백그라운드 설정
        .background(
          Color(.black).opacity(0.7)
        )
      }
    }
  }
}
