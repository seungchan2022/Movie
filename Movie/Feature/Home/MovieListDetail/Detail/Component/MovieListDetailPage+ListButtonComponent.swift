import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct ListButtonCompoenent {
    let viewState: ViewState
    
    @Binding var wishListSelected: Bool
    @Binding var seenListSelected: Bool
    @Binding var isActionSheetShowing: Bool
  }
}

extension MovieListDetailPage.ListButtonCompoenent: View {
  var body: some View {
    VStack {  // wishlist, seenlist
      HStack {
        Button(action: {
          wishListSelected.toggle()
          seenListSelected = false
        }) {
          HStack(spacing: 2) {
            if wishListSelected {
              Image(systemName: "heart.fill")
                .renderingMode(.template)
              Text("In wishlist")
                .font(.subheadline)
                .fontWeight(.bold)
            } else {
              Image(systemName: "heart")
                .foregroundColor(AppColor.Tint.primary)
              Text("Wishlist")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(AppColor.Tint.primary)
            }
          }
          .foregroundColor(.white)
          
        }
        .frame(width: wishListSelected ? 120 : 100, height: 30, alignment: .center)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .stroke(wishListSelected ? Color(.clear) : AppColor.Tint.primary, lineWidth: 1)
            .background(
              RoundedRectangle(cornerRadius: 5)
                .fill(wishListSelected ? AppColor.Tint.primary : .clear)
            )
        )
        
        Button(action: {
          wishListSelected = false
          seenListSelected.toggle()
        }) {
          HStack(spacing: 2) {
            if seenListSelected {
              Image(systemName: "eye.fill")
                .renderingMode(.template)
              Text("Seen")
                .font(.subheadline)
                .fontWeight(.bold)
            } else {
              Image(systemName: "eye")
                .foregroundColor(AppColor.Tint.secondary)
              Text("Seenlist")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(AppColor.Tint.secondary)
            }
          }
          .foregroundColor(.white)
          
        }
        .frame(width: seenListSelected ? 80 : 100, height: 30, alignment: .center)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .stroke(seenListSelected ? Color(.clear) : AppColor.Tint.secondary, lineWidth: 1)
            .background(
              RoundedRectangle(cornerRadius: 5)
                .fill(seenListSelected ? AppColor.Tint.secondary : .clear)
            )
        )
        
        Button(action: { isActionSheetShowing = true }) {
          HStack(spacing: 2) {
            Image(systemName: "pin")
            Text("List")
          }
        }
        .frame(width: 60, height: 30, alignment: .center)
        .foregroundColor(AppColor.Label.base)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .stroke(AppColor.Label.base, lineWidth: 1)
        )
        Spacer()
      } // list 버튼들
      .buttonStyle(.plain)
    }
    .padding(.top, 10)
    
  }
}

extension MovieListDetailPage.ListButtonCompoenent {
  struct ViewState: Equatable {
  }
}

