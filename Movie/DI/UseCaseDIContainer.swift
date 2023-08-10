import Foundation
import Platform

struct UseCaseDIContainer {
  
  let movieAPI: MovieAPI
  let movieDetailAPI: MovieDetailAPI
  let reviewAPI: ReviewAPI
  let creditAPI: CreditAPI
  let similarAPI: SimilarAPI
  let recommendAPI: RecommendAPI
  
  init() {
    let playListActor = MoviePlayListActor()
    let detailActor = MovieDetailActor()
    let reviewActor = MovieDetailActor()
    let creditActor = MovieDetailActor()
    let similarActor = MovieDetailActor()
    let recommendActor = MovieDetailActor()
    
    
    self.movieAPI = MovieAPI(
      getListTask: { try await playListActor.getList(pageNumber: $0) })
    self.movieDetailAPI = MovieDetailAPI(
      getDetailTask: { try await detailActor.getMovie(id: $0) })
    self.reviewAPI = ReviewAPI(
      getReviewTask: { try await reviewActor.getReview(id: $0) })
    self.creditAPI = CreditAPI(
      getCastTask: { try await creditActor.getCredit(id: $0) },
      getCrewTask: { try await creditActor.getCredit(id: $0) })
    
    self.similarAPI = SimilarAPI(
      getSimilarTask: { try await similarActor.getSimilar(id: $0) })
    
    self.recommendAPI = RecommendAPI(
      getRecommendTask: { try await recommendActor.getRecommend(id: $0) })
  }
}

extension UseCaseDIContainer: DIContainerType {
  
}
