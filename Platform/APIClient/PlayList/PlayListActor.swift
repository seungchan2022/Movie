import Foundation

public actor MoviePlayListActor {
 
  public init() { }
  
  let remote = Remote()
  
  @Sendable public func getList(pageNumber: Int) async throws -> MovieAPIModel.PlayList.Response {
    let request: MovieAPIModel.PlayList.Request = .init(
      apiKey: MovieAPIConst.apiKey,
      language: MovieAPIConst.language,
      page: pageNumber)
    
    let rawData = try await remote.fetch(url: request.serialized())
    return try JSONDecoder().decode(MovieAPIModel.PlayList.Response.self, from: rawData)
  }
}

extension MovieAPIModel.PlayList.Request {
  fileprivate func serialized() async -> URL? {
    var base = URLComponents(string: MovieAPIConst.baseURL)
    base?.path = "/3/movie/now_playing"
    
    base?.queryItems = [
      "api_key": MovieAPIConst.apiKey,
      "language": MovieAPIConst.language,
      "region": region,
      "page": "\(page)"
    ].map { .init(name: $0.key, value: $0.value) }
    
    return base?.url
  }
}
