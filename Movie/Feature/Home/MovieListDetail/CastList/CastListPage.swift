import Foundation
import DesignSystem
import SwiftUI
import Platform

struct CastListPage {
  @ObservedObject var viewStore: CastListStore
}

extension CastListPage {
  var state: CastListStore.State {
    viewStore.state
  }
  
  var isLoading: Bool {
    print("AA state.fetchCastData.isLoading", state.fetchCastData.isLoading)
    
    return state.fetchCastData.isLoading
  }
  
  var castItemList: [MovieAPIModel.Detail.Credit.Response.Cast]? {
    guard let castList = state.fetchCastData.value?.castList else {
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

extension CastListPage: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        if let castItemList {
          ForEach(castItemList) { item in
            VStack {
              Button(action: { print(item.name) }) {
                //              Divider()
                HStack {
                  if let imageURL = item.profileImage?.imagePath {
                    RemoteImage(url: imageURL)
                      .frame(width: 60, height: 100)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  }
                  else {
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray)
                      .frame(width: 60, height: 100)
                  }
                  
                  VStack(alignment: .leading, spacing: 8) {
                    Text(item.name)
                    Text(item.character)
                      .font(.subheadline)
                      .foregroundColor(AppColor.Label.base2)
                  }
                  Spacer()
                  
                  Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundColor(AppColor.Label.base2)
                }
                .padding(12)
              }
             .foregroundColor(Color(.label))
            }
            Divider()
          }
        }
      }
      
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(AppColor.Background.base)
      )
      .padding(.horizontal, 16)
    }
    .background(AppColor.Background.base2)

    .navigationTitle("Cast")
    .setLoading(isLoading)
    .onAppear {
      viewStore.send(.loadItem)
    }
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}


