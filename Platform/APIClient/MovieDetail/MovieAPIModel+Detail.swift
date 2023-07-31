import Foundation

extension MovieAPIModel {
  public enum Detail {
    public enum Movie: Equatable {}
//    public enum Video: Equatable {}
//    public enum SimialrMovie: Equatable {}
//    public enum Review: Equatable {}
//    public enum RecommendMovie: Equatable {}
//    public enum Credential: Equatable {}
  }
}

extension MovieAPIModel.Detail.Movie {
  public struct Request: Equatable {
    public let apiKey: String
    public let movieID: String
    public let language: String
    public let includeImageLanguage: String
    public let appendToResponse: [String]
    
    public init(
      apiKey: String,
      movieID: String,
      language: String,
      includeImageLanguage: String = "en",
      appendToResponse: [String] = ["keyword", "images"])
    {
      self.apiKey = apiKey
      self.movieID = movieID
      self.language = language
      self.includeImageLanguage = includeImageLanguage
      self.appendToResponse = appendToResponse
    }
  }
  
  public struct Response: Equatable, Decodable, Identifiable {
    
    public let id: Int
    public let genres: [Genre]
    public let posterPath: String?
    public let overView: String
    public let releaseDate: String
    public let runtime: Int
//    public let status: String
    public let productionCountries: [ProductionCountries]
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int

    private enum CodingKeys: String, CodingKey {
    
      case id = "id"
      case genres = "genres"
      case posterPath = "poster_path"
      case overView = "overview"
      case releaseDate = "release_date"
      case runtime = "runtime"
//      case status = "status"
      case productionCountries = "production_countries"
      case title = "title"
      case voteAverage = "vote_average"
      case voteCount = "vote_count"
    }
  }

  public struct Genre: Equatable, Decodable, Identifiable {
    public let id: Int
    public let name: String

    private enum CodingKeys: String, CodingKey {
      case id, name
    }
  }
  
  public struct ProductionCountries: Equatable, Decodable {
    public let iso31661: String
    public let name: String

    private enum CodingKeys: String, CodingKey {
      case iso31661 = "iso_3166_1"
      case name = "name"
    }
  }
}
//
//extension MovieAPIModel.Detail.Video {
//  public struct Request: Equatable {
//
//  }
//
//  public struct Response: Equatable, Decodable {
//
//  }
//}
//
//extension MovieAPIModel.Detail.SimialrMovie {
//  public struct Request: Equatable {
//
//  }
//
//  public struct Response: Equatable, Decodable {
//
//  }
//}
//
//extension MovieAPIModel.Detail.Review {
//  public struct Request: Equatable {
//
//  }
//
//  public struct Response: Equatable, Decodable {
//
//  }
//}
//
//extension MovieAPIModel.Detail.RecommendMovie {
//  public struct Request: Equatable {
//
//  }
//
//  public struct Response: Equatable, Decodable {
//
//  }
//}
//
//extension MovieAPIModel.Detail.Credential {
//  public struct Request: Equatable {
//
//  }
//
//  public struct Response: Equatable, Decodable {
//
//  }
//}
