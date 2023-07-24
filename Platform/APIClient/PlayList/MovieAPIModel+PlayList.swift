import Foundation

extension MovieAPIModel {
  public enum PlayList {}
}

extension MovieAPIModel.PlayList {
  public struct Request: Equatable {
    public let apiKey: String
    public let language: String
    public let region: String
    public let page: Int
    
    public init(
      apiKey: String,
      language: String,
      region: String = "US",
      page: Int)
    {
      self.apiKey = apiKey
      self.language = language
      self.region = region
      self.page = page
    }
  }
}

extension MovieAPIModel.PlayList {
  // 응답을 받을 때는 JSON 형태로 받으므로 디코딩이 필요하기 때문에 Decodable을 준수해야 한다.
  public struct Response: Equatable, Decodable {
    
    public let page: Int
    public let itemList: [Item]
    public let totalPages: Int
    public let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
      case page = "page"
      case itemList = "results"
      case totalPages = "total_pages"
      case totalResults = "total_results"
    }
    
    public struct Item: Equatable, Decodable, Identifiable {
      public let id: Int
      public let title: String
      public let overView: String
      public let posterPath: String?
      public let voteAverage: Double
      public let releaseDate: String
      
      private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overView = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
      }
    }
  }
}

