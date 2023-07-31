import Foundation

public struct MovieAPIConst {
  static let baseURL: String = "https://api.themoviedb.org"
  public static let imageBaseURL: String = "https://image.tmdb.org/t/p/original"
  static let apiKey: String = "1d9b898a212ea52e283351e521e17871"
  static let language: String = Locale.preferredLanguages.first ?? "en-US"
}

struct MovieDetailAPIConst {
  static let baseURL: String = "https://api.themoviedb.org"
  static let apiKey: String = "1d9b898a212ea52e283351e521e17871"
  static let language: String = Locale.preferredLanguages.first ?? "en-US"
}

