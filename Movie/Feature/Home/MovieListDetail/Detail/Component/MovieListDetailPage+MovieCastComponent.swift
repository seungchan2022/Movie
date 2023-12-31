import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct MovieCastComponent {
    let viewState: ViewState
    let tapAction: () -> Void
  }
}

extension MovieListDetailPage.MovieCastComponent {
  var itemList: [MovieAPIModel.Detail.Credit.Response.Cast]? {
    guard let castList = viewState.cast?.castList else {
      return nil
    }
    
    var uniqueCastId = Set<Int>()
    var uniqueCastList = [MovieAPIModel.Detail.Credit.Response.Cast]()
    
    for castMember in castList {
      if !uniqueCastId.contains(castMember.id) {
        uniqueCastId.insert(castMember.id)
        uniqueCastList.append(castMember)
      }
    }
    return uniqueCastList
  }
}

extension MovieListDetailPage.MovieCastComponent: View {
  var body: some View {
    if let itemList {
      VStack {
        Button(action: { tapAction() }) {
          HStack(spacing: 8) {
            Text("Cast")
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
                    Text(item.character)
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

extension MovieListDetailPage.MovieCastComponent {
  struct ViewState: Equatable {
    let cast: MovieAPIModel.Detail.Credit.Response?
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

