import Foundation
import SwiftUI
import DesignSystem


extension MovieListPage {
  struct MovieCardComponent {
    let viewState: ViewState
    let tapAction: (MovieListStore.State.ScopeItem) -> Void
  }
}

extension MovieListPage.MovieCardComponent {
  private func formatDate(_ dateString: String) -> String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd"
    
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = "M/d/yy"
    
    if let date = inputDateFormatter.date(from: dateString) {
      return outputDateFormatter.string(from: date)
    } else {
      return ""
    }
  }
  
  private var lineColor: Color {
    if viewState.item.rate >= 75 {
      return .green
    } else if viewState.item.rate >= 50 {
      return .yellow
    } else {
      return .red
    }
  }
}

extension MovieListPage.MovieCardComponent: View {
  var body: some View {
    HStack(spacing: 16) {
      RemoteImage(url: viewState.item.imageURL)
        .frame(width: 100, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 10))
      
      VStack(alignment: .leading, spacing: 16) {
        Spacer()
        Text(viewState.item.title)
          .font(.system(size: 18, weight: .medium))
          .foregroundColor(AppColor.Label.base)
        
        HStack(spacing: 10) {
          Circle()
            .trim(from: 0, to: CGFloat(viewState.item.rate / 100))
            .stroke(
              lineColor,
              style: StrokeStyle(
                lineWidth: 2,
                lineCap: .round,
                dash: [0.5, 2.5]))
            .frame(width: 40, height: 40)
            .rotationEffect(Angle(degrees: -90))
            .blur(radius: 0.7)
            .overlay {
              Text("\(viewState.item.rate, specifier: "%.0f")%")
                .font(.system(size: 12, weight: .medium))
            }
          
          Text(formatDate(viewState.item.date))
        }
        .font(.system(size: 16, weight: .medium))
        
        Text(viewState.item.summary)
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(AppColor.Label.base2)
        
        Spacer()
      }
      
      Spacer()
      
      Image(systemName: "chevron.right")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 10, height: 10)
        .foregroundColor(AppColor.Label.base2)

    }
    .frame(height: 200)
    .onTapGesture {
      tapAction(viewState.item)
    }
  }
}

extension MovieListPage.MovieCardComponent {
  struct ViewState: Equatable {
    let item: MovieListStore.State.ScopeItem
  }
}

