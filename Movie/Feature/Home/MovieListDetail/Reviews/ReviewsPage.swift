import Foundation
import SwiftUI
import Platform
import DesignSystem

struct ReviewsPage {
  @ObservedObject var viewStore: ReviewsStore
}

extension ReviewsPage {
  var state: ReviewsStore.State {
    viewStore.state
  }
  
  var isLoading: Bool {
    print("AA state.fetchReviewData.isLoading", state.fetchReviewData.isLoading)
    
    return state.fetchReviewData.isLoading
  }
  
  private var reviewItemList: [MovieAPIModel.Detail.Review.Response.Item]?  {
    guard let list = state.fetchReviewData.value?.itemList else { return .none }
    return list
  }
}

extension ReviewsPage: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        if let reviewItemList {
          ForEach(reviewItemList) { item in
            VStack(alignment: .leading, spacing: 8) {
              Text("Review written by \(item.author)")
                .fontWeight(.bold)
              Text(item.content)
              
              Spacer()
              
              Divider()
            }
            .padding(.top, 8)
            .padding(.horizontal ,16)
          }
        }
      }
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(AppColor.Background.base)
      )
      .padding(.horizontal, 16)
      
    }
    .navigationBarTitleDisplayMode(.large)
    .navigationTitle("Reviews")
    .background(AppColor.Background.base2)
    .setLoading(isLoading)
    .onAppear {
      viewStore.send(.loadItem)
    }
  }
}

