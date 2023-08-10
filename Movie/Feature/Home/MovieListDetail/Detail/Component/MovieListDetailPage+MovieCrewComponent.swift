import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct MovieCrewComponent {
    let viewState: ViewState
    let tapAction: () -> Void
  }
}

//extension MovieListDetailPage.MovieCrewComponent {
//  var itemList: [MovieAPIModel.Detail.Credit.Response.Crew]? {
//   viewState.crew?.crewList
//  }
//}

//array의 중복된 값이 있어서 중복을 제거하려고 Set로 변환시켰는데 순서가 원래 array순서로 나타내고 싶을때 사용하는 방법
extension MovieListDetailPage.MovieCrewComponent {
  var itemList: [MovieAPIModel.Detail.Credit.Response.Crew]? {
    guard let crewList = viewState.crew?.crewList else {
      return nil
    }
    
    var uniqueCrewId = Set<Int>() // 이미 본 크루 멤버 ID를 추적
    var uniqueCrewList = [MovieAPIModel.Detail.Credit.Response.Crew]()
    
    for crewMember in crewList {
      if !uniqueCrewId.contains(crewMember.id) {
        uniqueCrewId.insert(crewMember.id)
        uniqueCrewList.append(crewMember)
      }
    }
    return uniqueCrewList
  }
}

extension MovieListDetailPage.MovieCrewComponent: View {
  var body: some View {
    if let itemList {
      VStack {
        Button(action: { tapAction() }) {
          HStack(spacing: 8) {
            Text("Crew")
              .font(.system(size: 16, weight: .bold))
              .foregroundColor(Color(.label))
            Text("See all")
              .foregroundColor(AppColor.Label.base3)
            Spacer()
            
            Image(systemName: "chevron.right")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 10, height: 10)
              .foregroundColor(Color(.label))
              .padding(4)
          }
        }
        
        // image에 대한 버튼을 누르면 해당 선택한 사람의 프로필로 이동하도록 구현 할 것
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: 16) {
            ForEach(itemList) { item in
              Button(action: { tapAction() }) {
                VStack {
                  if let imageURL = item.profileImage {
                    RemoteImage(url: imageURL.imagePath)
                      .frame(width: 60, height: 100)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  }
                  else {
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray)
                      .frame(width: 60, height: 100)
                  }
                  
                  Group {
                    Text(item.name)
                      .foregroundColor(Color(.label))
                    Text(item.department)
                      .foregroundColor(AppColor.Label.base2)
                  }
                  .font(.system(size: 12, weight: .medium))
                  .frame(width: 80)
                  .lineLimit(.zero)
                  .multilineTextAlignment(.center)
                }
              }
            }
          }
        }
      }
    } else {
      EmptyView()
    }
  }
}

extension MovieListDetailPage.MovieCrewComponent {
  struct ViewState: Equatable {
    let crew: MovieAPIModel.Detail.Credit.Response?
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

