import Foundation
import Platform

struct UseCaseDIContainer {
  
  let movieAPI: MovieAPI
  let movieDetailAPI: MovieDetailAPI
  let reviewAPI: ReviewAPI
  let creditAPI: CreditAPI
  
  init() {
    let playListActor = MoviePlayListActor()
    let detailActor = MovieDetailActor()
    let reviewActor = MovieDetailActor()
    let creditActor = MovieDetailActor()
    
    self.movieAPI = MovieAPI(
      getListTask: { try await playListActor.getList(pageNumber: $0) })
    self.movieDetailAPI = MovieDetailAPI(
      getDetailTask: { try await detailActor.getMovie(id: $0) })
    self.reviewAPI = ReviewAPI(
      getReviewTask: { try await reviewActor.getReview(id: $0) })
    self.creditAPI = CreditAPI(
      getCreidtTask: { try await creditActor.getCredit(id: $0) })
  }
}

extension UseCaseDIContainer: DIContainerType {
  
}
