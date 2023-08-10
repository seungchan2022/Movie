import Foundation
import DesignSystem
import SwiftUI
import Platform

struct CrewListPage {
  @ObservedObject var viewStore: CrewListStore
}

extension CrewListPage {
  var state: CrewListStore.State {
    viewStore.state
  }
  
  var isLoading: Bool {
    print("AA state.fetchCrewData.isLoading", state.fetchCrewData.isLoading)
    
    return state.fetchCrewData.isLoading
  }
  
  var crewItemList: [MovieAPIModel.Detail.Credit.Response.Crew]? {
    guard let crewList = state.fetchCrewData.value?.crewList else {
      return nil
    }
    
    var uniqueCrewId = Set<Int>()
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

extension CrewListPage: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        if let crewItemList {
          ForEach(crewItemList) { item in
            VStack {
              Button(action: { print(item.name )}) {
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
                    Text(item.department)
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
      .padding(.horizontal ,16)
    }
    .background(AppColor.Background.base2)
    
    .navigationTitle("Crew")
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


