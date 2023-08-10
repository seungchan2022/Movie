import Foundation
import SwiftUI
import DesignSystem

struct MovieListDetailPage {
  @ObservedObject var viewStore: MovieListDetailStore
  @State private var wishListSelected = false
  @State private var seenListSelected = false
  @State private var isActionSheetShowing = false
}

extension MovieListDetailPage {
  var state: MovieListDetailStore.State {
    viewStore.state
  }
  
  var isLoading: Bool {
    print("AA state.fetchMovieData.isLoading", state.fetchMovieData.isLoading)
    print("AA state.fetchReviewData.isLoding", state.fetchReviewData.isLoading)
    
    return state.fetchMovieData.isLoading
    || state.fetchReviewData.isLoading
  }
  
  var addOrRemoveDescription: String {
    guard let title = state.fetchMovieData.value?.title else { return ""}
    return "Add or remove \(title) from your lists"
  }
  
  var selectedDescription: String {
    seenListSelected ? "Remove from seenList" : "Add to seenList"
  }
  
  private var movieCardComponentViewState: MovieCardComponent.ViewState {
    .init(movie: state.fetchMovieData.value)
  }
  
  private var listButtonComponentViewState: ListButtonCompoenent.ViewState {
    .init()
  }
  
  private var movieReviewComponentViewState: MovieReviewComponent.ViewState {
    .init(review: state.fetchReviewData.value)
  }
  
  private var movieOverViewComponentViewState: MovieOverviewComponent.ViewState {
    .init(movie: state.fetchMovieData.value)
  }
  
  private var movieKeywordComponentViewState: MovieKeywordsComponent.ViewState {
    .init(movie: state.fetchMovieData.value)
  }
  
  // review처럼 다른 API를 같이 쏠 것임 -> 일단 먼저 틀잡기
  private var movieCastComponentViewState: MovieCastComponent.ViewState {
    .init(cast: state.fetchCastData.value)
  }
  
  private var movieDirectorComponentViewState: MovieDirectorComponent.ViewState {
    .init()
  }
  
  private var movieCrewComponentViewState: MovieCrewComponent.ViewState {
    .init(crew: state.fetchCrewData.value)
  }
  
  private var similarListComponentViewState: SimilarListComponent.ViewState {
    .init(similar: state.fetchSimilarData.value)
  }
  
  private var recommendListComponentViewState: RecommendListComponent.ViewState {
    .init(recommend: state.fetchRecommendData.value)
  }
}

extension MovieListDetailPage: View {
  var body: some View {

    ScrollView {
      VStack(spacing: 16) {
        MovieCardComponent(
          viewState: movieCardComponentViewState)
        
        Group {
          ListButtonCompoenent(
            viewState: .init(),
            wishListSelected: $wishListSelected,
            seenListSelected: $seenListSelected,
            isActionSheetShowing: $isActionSheetShowing)
          
          Divider()
          
          MovieReviewComponent(
            viewState: movieReviewComponentViewState,
            tapAction: { viewStore.send(.onTapReview) })
          
          Divider()
          
          MovieOverviewComponent(viewState: movieOverViewComponentViewState)
        } // overview까지
        .padding(.horizontal, 12)
      }
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(AppColor.Background.base)
      )
      .padding(.horizontal, 16)
      
      // List에서는 Secion을 나누면 다음 Section과 알아서 나누어지 지는데 ScrollView에서는 그렇지 않으므로 Divider를 커스텀해서 사용해봄
      // -> Divider를 사용했는데 Color.clear 해도 선이 계속 나옴
      // -> 따라서 다음과 같이 설정
      Rectangle()
        .frame(height: 30)
        .foregroundColor(Color.clear)
      
      VStack(spacing: 16) {
        Group {
          // keyword
          MovieKeywordsComponent(
            viewState: movieKeywordComponentViewState,
            tapAction: { print($0) })
          
          Divider()
          
          // cast
          MovieCastComponent(
            viewState: movieCastComponentViewState,
            tapAction: { viewStore.send(.onTapCastList) })
          
          Divider()
          
          // director
          MovieDirectorComponent(
            viewState: movieDirectorComponentViewState,
            tapAction: { viewStore.send(.onTapDirector) })
          
          Divider()
          
          // crew
          MovieCrewComponent(
            viewState: movieCrewComponentViewState,
            tapAction: { viewStore.send(.onTapCrewList) })
          
          Divider()
        }
        .padding(.horizontal, 12)
        
        Group {
          // similar movie
          SimilarListComponent(
            viewState: similarListComponentViewState,
            tapAction: { viewStore.send(.onTapSimilarList) })
          
          Divider()
          
          
          // recommend movie
          RecommendListComponent(
            viewState: recommendListComponentViewState,
            tapAction: { viewStore.send(.onTapRecommendList) })
        }
        // other posters
        
        // Images
        
        .padding(.horizontal, 12)
      }
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(AppColor.Background.base)
      )
      .padding(.horizontal ,16)
    }
    .background(AppColor.Background.base2)
    .navigationTitle(state.fetchMovieData.value?.title ?? "")
    
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { isActionSheetShowing = true}) {
          Image(systemName: "text.badge.plus")
            .foregroundColor(AppColor.Label.base)
        }
      }
    }
    .confirmationDialog(
      addOrRemoveDescription,
      isPresented: $isActionSheetShowing,
      titleVisibility: .visible)
    {
      Button(
        selectedDescription,
        role: wishListSelected ? .destructive : .none,
        action: {
          wishListSelected.toggle()
          seenListSelected = false
        })
      
      Button(
        selectedDescription,
        role: seenListSelected ? .destructive : .none,
        action: {
          seenListSelected.toggle()
          wishListSelected = false
        })
      
      Button("Create list", role: .none, action: { print("Did tap create list")})
      Button("Cancel", role: .cancel, action: { print("Cancel")})
    }
    .setLoading(isLoading)
    .animation(.spring(), value: state)
    .onAppear {
      viewStore.send(.loadItem)
    }
  }
}


