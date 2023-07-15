import Foundation
import SwiftUI

struct ProfilePage {
  @ObservedObject var viewModel: ProfileViewModel
  @State private var clickFanButton = false
  @State private var isBiographyTapped = false
}

extension ProfilePage {
  var state: ProfileViewModel.State {
    viewModel.state
  }
}

extension ProfilePage: View {
  
  var body: some View {
    List {
      VStack(alignment: .leading, spacing: 8) {
        HStack(spacing: 10) {
          Image("alan")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 140)
            .cornerRadius(10)
          
          VStack(alignment: .leading, spacing: 5) {
            Text("Known for")
              .font(.system(size: 18, weight: .medium))
            Text("Acting")
              .font(.system(size: 16, weight: .medium))
            Text("Edward Scissorhands, Argo, Gattaca")
              .font(.system(size: 18, weight: .medium))
              .foregroundColor(.gray)
            
            Spacer()
          }
          Spacer()
        }
        
        // MARK: - Biography
        
        Text("Biography")
          .font(.system(size: 18, weight: .medium))
        
        Text(isBiographyTapped ? "Alan Wolf Arkin (March 26, 1934 - June 29, 2023) was an American actor, diector, musician and singer. He was known for starring in such film as Wait Until Dark, The Russians Are Coming, the Russians Are Coming, Minions: The Rise of Gru, The Heart is a Lonely Hunger, Catch-22" : "Alan Wolf Arkin (March 26, 1934 - June 29, 2023) was an American actor, diector, musician and singer. He was known for starring in...")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.gray)
                
        Button(action: { isBiographyTapped.toggle()}) {
          Text(isBiographyTapped ? "Less" : "Read more")
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(Color(.systemMint).opacity(0.5))
        }

        // MARK: - Place of birth
        Text("Place of birth")
          .font(.system(size: 18, weight: .medium))
        
        Text("New York City, New York, USA")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.gray)
        
        // MARK: - Fan level
        if clickFanButton {
          Text("Fan level")
            .font(.system(size: 18, weight: .medium))
          Text("0%")
            .font(.system(size: 14, weight: .light))
            .padding(.leading, 20)
        }
        
        // MARK: - Images
        Group {
          Text("Images")
            .font(.system(size: 18, weight: .medium))
          HStack(spacing: 10) {
            Image("alan")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 60, height: 80)
              .cornerRadius(10)
            
            Image("alan")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 60, height: 80)
              .cornerRadius(10)
            
            Spacer()
          }
//          .padding(.top, -10)
        }
        .padding(.top, 20)
      }
      Section(header: HStack {
        Text("2023")
          .font(.headline)
          .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0))
        
        Spacer()
      }
        .background(Color.gray.opacity(0.3))
        .listRowInsets(EdgeInsets(
          top: 0,
          leading: 0,
          bottom: 0,
          trailing: 0))
      ) {
        ForEach(state.itemList, id: \.title) { item in
          
          HStack(spacing: 10) {
            Image(uiImage: item.image ?? UIImage())
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 60, height: 80)
              
            VStack(spacing: 8) {
              Text(item.title)
                .font(.system(size: 14, weight: .bold))
              Text("Production")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.gray)
            }
            Spacer()
          }
          .onTapGesture {
            // detail page
            viewModel.send(action: .onShowMovieDetail)
          }
          .listRowInsets(EdgeInsets())
        }
      }
      
      Section(header: HStack {
        Text("2022")
          .font(.headline)
          .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0))
        
        Spacer()
      }
        .background(Color.gray.opacity(0.3))
        .listRowInsets(EdgeInsets(
          top: 0,
          leading: 0,
          bottom: 0,
          trailing: 0))
      ) {
        Text("")
      }

      
      
    }
    .onAppear {
      viewModel.send(action: .loadItemList)
    }
    .listStyle(.plain)

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
  }
}

