import SwiftUI

struct CustomListsPage {
  @State private var listName = ""
  @State private var searchMovie = ""
  @Environment(\.dismiss) var dismiss
}

extension CustomListsPage: View {
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Spacer()
        Spacer()
        
        // List information
        Text("LIST INFORMATION")
          .font(.system(size: 16, weight: .light))
          .foregroundColor(.gray)
          .padding(.horizontal, 12)
          .padding(.top, 12)
        
        HStack {
          Text("Name:")
            .font(.system(size: 18, weight: .bold))
          
          TextField("Name your list", text: $listName)
            .font(.system(size: 18, weight: .medium))
            .textFieldStyle(.plain)
        }
        .frame(width: 320 ,height: 50)
        .padding(.horizontal, 16)
        .background(
          RoundedRectangle(cornerRadius: 8)
            .stroke(.black, lineWidth: 1)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.2))))
        
        // List cover
        Text("LIST COVER")
          .font(.system(size: 16, weight: .light))
          .foregroundColor(.gray)
          .padding(.horizontal, 12)
          .padding(.top, 8)
        
        HStack {
          Image(systemName: "magnifyingglass")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
          
          TextField("Search and add a movie", text: $searchMovie)
            .font(.system(size: 18, weight: .medium))
            .textFieldStyle(.plain)
            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
            .background(
              RoundedRectangle(cornerRadius: 5)
                .fill(.black))
        }
        .frame(width: 320 ,height: 50)
        .padding(.horizontal, 16)
        .background(
          RoundedRectangle(cornerRadius: 8)
            .stroke(.black, lineWidth: 1)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.2))))
        .padding(.bottom, 20)
        
        // cover, cancel
        VStack(alignment: .leading, spacing: .zero) {
          // create
          Text("Create")
            .foregroundColor(Color(.systemBlue))
            .font(.system(size: 20, weight: .medium))
            .frame(width: 320 ,height: 50, alignment: .leading)
            .padding(.horizontal, 16)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(.black, lineWidth: 1)
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.2)))
            )
            .onTapGesture {
              // create
            }

          // cancel
          Text("Cancel")
            .foregroundColor(Color(.systemRed))
            .font(.system(size: 20, weight: .medium))
            .frame(width: 320 ,height: 50, alignment: .leading)
            .padding(.horizontal, 16)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(.black, lineWidth: 1)
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.2)))
            )
            .onTapGesture {
              dismiss()
            }
        }
      }
    }
  }
}
