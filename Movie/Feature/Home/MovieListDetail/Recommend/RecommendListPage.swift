import Foundation
import SwiftUI
import Platform
import DesignSystem

struct RecommendListPage {
  @ObservedObject var viewStore: RecommendListStore
}

extension RecommendListPage {
  var state: RecommendListStore.State {
    viewStore.state
  }
  
  private var isLoading: Bool {
    print("AA state.fethItemList.isLoading",
          state.fetchItemList.isLoading)
    
    return state.fetchItemList.isLoading
  }
  
  private var movieCardComponentViewState: MovieCardComponent.ViewState {
    .init(movie: state.fetchItemList.value)
  }
}

extension RecommendListPage: View {
  var body: some View {
    ScrollView {
      MovieCardComponent(
        viewState: movieCardComponentViewState,
//        tapAction: { print("ID test: ", $0 )})
//        tapAction: { viewStore.send(.onSelectedDetailItem($0) )})
        tapAction: {
          // 선택한 항목의 ID를 사용하여 상세 페이지로 이동
          viewStore.send(.onSelectedDetailItem)
        })
    }
    .setLoading(isLoading)
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}
