import Foundation

public actor MovieDetailActor {
  
  public init() { }
  
  let remote = Remote()
  
  @Sendable public func getMovie(id: String) async throws -> MovieAPIModel.Detail.Movie.Response {
    
    // request에서 MovieList 처럼 pageNumber를 날린 것처럼 여기서는 파라미터가 id이므로 id를 날려야 될거 같은데 어떻게 하지..?
    let request: MovieAPIModel.Detail.Movie.Request = .init(
      apiKey: MovieDetailAPIConst.apiKey,
      movieID: id,
      language: MovieDetailAPIConst.language)
    
    let rawData = try await remote.fetch(url: request.serialized())
    return try JSONDecoder().decode(MovieAPIModel.Detail.Movie.Response.self, from: rawData)
  }
  
  //  @Sendable public func getVideo(id: Int) async throws -> MovieAPIModel.Detail.Video.Response {
  //    return .init()
  //  }
  //
  //  @Sendable public func getSimialrMovie(id: Int) async throws -> MovieAPIModel.Detail.SimialrMovie.Response {
  //    return .init()
  //  }
  //
  //  @Sendable public func getReview(id: Int) async throws -> MovieAPIModel.Detail.Review.Response {
  //    return .init()
  //  }
  //
  //  @Sendable public func getRecommendMovie(id: Int) async throws -> MovieAPIModel.Detail.RecommendMovie.Response {
  //    return .init()
  //  }
  //
  //  @Sendable public func getCredential(id: Int) async throws -> MovieAPIModel.Detail.Credential.Response {
  //    return .init()
  //  }
  //}
}

extension MovieAPIModel.Detail.Movie.Request {
  fileprivate func serialized() async -> URL? {
    var base = URLComponents(string: MovieDetailAPIConst.baseURL)
    base?.path = "/3/movie/\(movieID)"

    base?.queryItems = [
      "api_key": MovieDetailAPIConst.apiKey,
      "language": MovieDetailAPIConst.language,
      "include_image_language": includeImageLanguage,
      "append_to_response": appendToResponse.joined(separator: ",")
    ].map { .init(name: $0.key, value: $0.value) }

    return base?.url
  }
}
