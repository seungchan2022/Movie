import Foundation

// 각 페이지에서 설정한 모습이 나오도록
// 이곳에 설정해야 제대로된 데이터가 나온다
// AppDIContainer는 tabbarItme에 대한 정보만 
struct FeatureDIContainer {
  var production: [FeatureBuildType] {
    [
    MovieListRouteBuilder(),
    DiscoverListRouteBuilder(),
    FanClubListRouteBuilder(),
    MyListsListRouteBuilder(),
    MovieListDetailPageRouteBuilder(),
    ReviewsRouteBuilder(),
    CastListRouteBuilder(),
    DirectorPageRouteBuilder(),
    ProfileRouteBuilder(),
    ]
  }
}
