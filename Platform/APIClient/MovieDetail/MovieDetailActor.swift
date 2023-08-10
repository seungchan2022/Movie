import Foundation

public actor MovieDetailActor: Sendable {
  
  public init() { }
  
  let remote = Remote()
  
  // MARK: Movie
  @Sendable public func getMovie(id: String) async throws -> MovieAPIModel.Detail.Movie.Response {
    
    // request에서 MovieList 처럼 pageNumber를 날린 것처럼 여기서는 파라미터가 id이므로 id를 날려야 될거 같은데 어떻게 하지..?
    let request: MovieAPIModel.Detail.Movie.Request = .init(
      apiKey: MovieDetailAPIConst.apiKey,
      movieID: id,
      language: MovieDetailAPIConst.language)

    let rawData = try await remote.fetch(url: request.serialized())
    return try JSONDecoder().decode(MovieAPIModel.Detail.Movie.Response.self, from: rawData)
  }
  
  // MARK: Review
  @Sendable public func getReview(id: String) async throws -> MovieAPIModel.Detail.Review.Response {
    
    let request: MovieAPIModel.Detail.Review.Request = .init(
      apiKey: ReviewAPIConst.apiKey,
      movieID: id,
      language: ReviewAPIConst.language)

    let rawData = try await remote.fetch(url: request.serializedReview())
    return try JSONDecoder().decode(MovieAPIModel.Detail.Review.Response.self, from: rawData)
  }
  
  // MARK: Credit
  @Sendable public func getCredit(id: String) async throws -> MovieAPIModel.Detail.Credit.Response {
    
    let request: MovieAPIModel.Detail.Credit.Request = .init(
      apiKey: CreditAPIConst.apiKey,
      movieID: id,
      language: CreditAPIConst.language)
    
    let rawData = try await remote.fetch(url: request.serializedCredit())
    
    return try JSONDecoder().decode(MovieAPIModel.Detail.Credit.Response.self, from: rawData)
  }
  
  // MARK: Similar
  @Sendable public func getSimilar(id: String) async throws -> MovieAPIModel.Detail.Similar.Response {
    
    let request: MovieAPIModel.Detail.Similar.Request = .init(
      apiKey: SimilarAPIConst.baseURL,
      movieID: id,
      language: SimilarAPIConst.language)
    
    let rawData = try await remote.fetch(url: request.serializedSimilar())
    
    return try JSONDecoder().decode(MovieAPIModel.Detail.Similar.Response.self, from: rawData)
  }
  
  // MARK: Recommend
  @Sendable public func getRecommend(id: String) async throws -> MovieAPIModel.Detail.Recommend.Response {
    
    let request: MovieAPIModel.Detail.Recommend.Request = .init(
      apiKey: RecommendAPIConst.baseURL,
      movieID: id,
      language: RecommendAPIConst.language)
    
    let rawData = try await remote.fetch(url: request.serializedRecommend())
    
    return try JSONDecoder().decode(MovieAPIModel.Detail.Recommend.Response.self, from: rawData)
  }
}

//  @Sendable public func getVideo(id: Int) async throws -> MovieAPIModel.Detail.Video.Response {
//    return .init()
//  }
//
//  @Sendable public func getRecommendMovie(id: Int) async throws -> MovieAPIModel.Detail.RecommendMovie.Response {
//    return .init()
//  }
//

extension MovieAPIModel.Detail.Movie.Request {
  fileprivate func serialized() async -> URL? {
    var base = URLComponents(string: MovieDetailAPIConst.baseURL)
    base?.path = "/3/movie/\(movieID)"
    
    base?.queryItems = [
      "api_key": MovieDetailAPIConst.apiKey,
      "language": MovieDetailAPIConst.language,
      "include_image_language": includeImageLanguage,
      "append_to_response": appendToResponse
    ].map { .init(name: $0.key, value: $0.value) }
    
    return base?.url
  }
}

extension MovieAPIModel.Detail.Review.Request {
  fileprivate func serializedReview() async -> URL? {
    var base = URLComponents(string: ReviewAPIConst.baseURL)
    base?.path = "/3/movie/\(movieID)/reviews"
    
    base?.queryItems = [
      "api_key": ReviewAPIConst.apiKey,
      "language": ReviewAPIConst.language
    ].map { .init(name: $0.key, value: $0.value)}
    
    return base?.url
  }
}

extension MovieAPIModel.Detail.Credit.Request {
  fileprivate func serializedCredit() async -> URL? {
    var base = URLComponents(string: CreditAPIConst.baseURL)
    base?.path = "/3/movie/\(movieID)/credits"
    
    base?.queryItems = [
      "api_key": CreditAPIConst.apiKey,
      "language": CreditAPIConst.language
    ].map { .init(name: $0.key, value: $0.value) }
    
    return base?.url
  }
}

extension MovieAPIModel.Detail.Similar.Request {
  fileprivate func serializedSimilar() async -> URL? {
    var base = URLComponents(string: SimilarAPIConst.baseURL)
    base?.path = "/3/movie/\(movieID)/similar"
    
    base?.queryItems = [
      "api_key": SimilarAPIConst.apiKey,
      "language": SimilarAPIConst.language
    ].map { .init(name: $0.key, value: $0.value) }
    
    return base?.url
  }
}

extension MovieAPIModel.Detail.Recommend.Request {
  fileprivate func serializedRecommend() async -> URL? {
    var base = URLComponents(string: RecommendAPIConst.baseURL)
    base?.path = "/3/movie/\(movieID)/recommendations"
    
    base?.queryItems = [
      "api_key": RecommendAPIConst.apiKey,
      "language": RecommendAPIConst.language
    ].map { .init(name: $0.key, value: $0.value) }
    
    return base?.url
  }
}
