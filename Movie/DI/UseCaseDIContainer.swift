import Foundation
import Platform

struct UseCaseDIContainer {
  
  let movieAPI: MovieAPI
  
  init() {
    let playListActor = MoviePlayListActor()
    self.movieAPI = MovieAPI(
      getListTask: { try await playListActor.getList(pageNumber: $0)
      })
  }
}

extension UseCaseDIContainer: DIContainerType {
  
}
