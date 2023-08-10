import Foundation
import SwiftUI
import DesignSystem

struct ProfilePage {
  @ObservedObject var viewStore: ProfileStore
  @State private var clickFanButton = false
  @State private var isBiographyTapped = false
}

extension ProfilePage {
  var state: ProfileStore.State {
    viewStore.state
  }
}

extension ProfilePage: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        
        Group {
          HStack(spacing: 8) {
            Image("alan")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 80, height: 100)
              .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
              Text("Know for")
                .font(.system(size: 18, weight: .medium))
              Text("Acting")
                .font(.system(size: 16, weight: .medium))
              Text("Edward Scissorhands, Argo, Gattaca")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(AppColor.Label.base2)
            }
          }
          .padding(.top, 8)
          
          Divider()
          
          VStack(alignment: .leading, spacing: 8) {
            Text("Biography")
              .font(.system(size: 18, weight: .medium))
            
            Text(isBiographyTapped ? "Alan Wolf Arkin (March 26, 1934 - June 29, 2023) was an American actor, diector, musician and singer. He was known for starring in such film as Wait Until Dark, The Russians Are Coming, the Russians Are Coming, Minions: The Rise of Gru, The Heart is a Lonely Hunger, Catch-22" : "Alan Wolf Arkin (March 26, 1934 - June 29, 2023) was an American actor, diector, musician and singer. He was known for starring in...")
              .font(.system(size: 16, weight: .medium))
            
            Button(action: { isBiographyTapped.toggle()}) {
              Text(isBiographyTapped ? "Less" : "Read more")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(AppColor.Label.base3)
            }
            
            Text("Place of birth")
              .font(.system(size: 18, weight: .medium))
            
            Text("New York City, New York, USA")
              .font(.system(size: 16, weight: .medium))
              .foregroundColor(AppColor.Label.base2)
          }
          
          Divider()
          
          VStack(alignment: .leading, spacing: 8) {
            if clickFanButton {
              Text("Fan level")
                .font(.system(size: 18, weight: .medium))
              Text("0%")
                .font(.system(size: 14, weight: .light))
                .padding(.leading, 20)
              Divider()
            }
          }
          
          VStack(alignment: .leading) {
            Text("Images")
              .font(.system(size: 18, weight: .medium))
            
            HStack(spacing: 10) {
              
              ForEach(0..<3) { _  in
                
                Image("alan")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 60, height: 80)
                  .cornerRadius(10)
              }
              Spacer()
            }
          }
          .padding(.bottom, 8)
        }
        .padding(.horizontal, 16)
      }
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(AppColor.Background.base)
      )
      .padding(.horizontal, 16)
      
      Rectangle()
        .frame(height: 30)
        .foregroundColor(Color.clear)
      
      VStack(alignment: .leading) {
        Text("2023")
          .foregroundColor(AppColor.Label.base2)
        LazyVStack {
          ForEach(state.itemList, id: \.name) { item in
            Button(action: { print(item.name) }) {
              HStack(spacing: 8) {
                Image(uiImage: item.image ?? UIImage())
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 60, height: 80)
                  .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8) {
                  Text(item.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(.label))
                  Text(item.name)
                    .font(.system(size: 14, weight: .medium))
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
          }
        }
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(AppColor.Background.base)
        )
      }
      .padding(.horizontal, 16)
      
      Rectangle()
        .frame(height: 30)
        .foregroundColor(Color.clear)
      
      VStack(alignment: .leading) {
        Text("2022")
          .foregroundColor(AppColor.Label.base2)
        LazyVStack {
          ForEach(state.itemList, id: \.name) { item in
            Button(action: { print(item.name) }) {
              HStack(spacing: 8) {
                Image(uiImage: item.image ?? UIImage())
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 60, height: 80)
                  .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8) {
                  Text(item.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(.label))
                  Text(item.name)
                    .font(.system(size: 14, weight: .medium))
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
          }
        }
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(AppColor.Background.base)
        )
      }
      .padding(.horizontal, 16)
      
      Rectangle()
        .frame(height: 30)
        .foregroundColor(Color.clear)
      
      VStack(alignment: .leading) {
        Text("2021")
          .foregroundColor(AppColor.Label.base2)
        LazyVStack {
          ForEach(state.itemList, id: \.name) { item in
            Button(action: { print(item.name) }) {
              HStack(spacing: 8) {
                Image(uiImage: item.image ?? UIImage())
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 60, height: 80)
                  .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8) {
                  Text(item.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(.label))
                  Text(item.name)
                    .font(.system(size: 14, weight: .medium))
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
          }
        }
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(AppColor.Background.base)
        )
      }
      .padding(.horizontal, 16)
    }
    .background(AppColor.Background.base2)
    
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          clickFanButton.toggle()
        } label: {
          Image(systemName: "star.circle")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .foregroundColor(clickFanButton ? .yellow : .white)
        }
      }
    }
    
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}

