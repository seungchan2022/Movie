import Foundation
import Platform

struct UseCaseDIContainer {
  
  let movieAPI: MovieAPI
  let movieDetailAPI: MovieDetailAPI
  
  init() {
    let playListActor = MoviePlayListActor()
    let detailActor = MovieDetailActor()
    self.movieAPI = MovieAPI(getListTask: { try await playListActor.getList(pageNumber: $0)
    })
    self.movieDetailAPI = MovieDetailAPI(getDetailTask: { try await detailActor.getMovie(id: $0)
    })
  }
}

extension UseCaseDIContainer: DIContainerType {
  
}
