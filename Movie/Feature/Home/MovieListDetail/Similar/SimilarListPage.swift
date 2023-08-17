import Foundation
import SwiftUI
import Platform
import DesignSystem

struct SimilarListPage {
  @ObservedObject var viewStore: SimilarListStore
}

extension SimilarListPage {
  var state: SimilarListStore.State {
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

extension SimilarListPage: View {
  var body: some View {
    ScrollView {
      MovieCardComponent(
        viewState: movieCardComponentViewState,
//        tapAction: { print("ID test: ", $0 )})
//        tapAction: { viewStore.send(.onSelectedDetailItem($0) )})
        tapAction: {
          // 선택한 항목의 ID를 사용하여 상세 페이지로 이동
          viewStore.send(.onSelectedDetailItem($0.id))
        })

    }
    .navigationTitle("Similar Movies")
    .setLoading(isLoading)
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}


