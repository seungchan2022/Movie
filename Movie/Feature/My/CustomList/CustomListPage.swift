import SwiftUI
import DesignSystem

struct CustomListsPage {
  @State private var listName = ""
  @State private var searchMovie = ""
  @Environment(\.dismiss) var dismiss
}

extension CustomListsPage: View {
  
  var body: some View {
    List {
      Section(header: Text("LIST INFORMATION")
        .padding(.top, 24)) {
          HStack {
            Text("Name:")
            TextField("Name your list", text: $listName)
              .textFieldStyle(.plain)
          }
          .font(.system(size: 18, weight: .medium))
        }
      
      Section(header: Text("LIST COVER")) {
        HStack(spacing: 16) {
          Image(systemName: "magnifyingglass")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
          
          TextField("Search and add a movie as your cover", text: $searchMovie)
            .font(.system(size: 18, weight: .medium))
            .textFieldStyle(.plain)
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
            .background(
              RoundedRectangle(cornerRadius: 5)
                .stroke(AppColor.Label.base2, lineWidth: 1))
        }
      }
      
      // cover, cancel
      // create
      Text("Create")
        .foregroundColor(Color(.systemBlue))
        .font(.system(size: 18, weight: .light))
        .onTapGesture {
          // create
        }
      
      // cancel
      Text("Cancel")
        .foregroundColor(Color(.systemRed))
        .font(.system(size: 18, weight: .light))
        .onTapGesture {
          dismiss()
        }
    }
  }
}
