import Foundation
import SwiftUI
import DesignSystem

struct SettingsPage {
  @State private var someToggle = false
  
  @State var regions = ["USA", "Canada", "UK", "Germany", "Japan", "China", "Korea", "Australia", "France", "Brazil", "India", "Italy", "Spain", "Mexico", "Russia", "Sweden", "Switzerland", "Netherlands", "Singapore", "South Africa"]
  @State var selectedItem = "Korea"
}

extension SettingsPage: View {
  var body: some View {
    List {
      Section(header: Text("REGION PREFERENCES")
        .padding(.top, 24), footer: Text("Region is usded to display a more accurate movie  list")) {
          
          Toggle("Always  show original title",
                 isOn: $someToggle)
          .toggleStyle(SwitchToggleStyle())
          .onChange(of: someToggle) { newValue in
            if newValue {
              print("Active")
            } else {
              print("Disabled")
            }
          }
          
          Picker("Region", selection: $selectedItem) {
            ForEach(regions.sorted(by: { $0 < $1 }), id: \.self) { item in
              Text(item)
            }
          }
        }
      
      Section(header: Text("APP DATA"), footer: Text("None of those action are working yet ;)")) {
        Text("Export my data")
        Text("Backup to iClod")
        Text("Restore from iCloud")
        Text("Reset appliction data")
          .foregroundColor(Color(.systemRed))
      }
      
      Section(header: Text("DEBUG INFO")) {
        HStack {
          Text("Movies in state")
          Spacer()
          Text("79")
            .foregroundColor(AppColor.Label.base2)
        }
        HStack {
          Text("Archived state size")
          Spacer()
          Text("2 KB")
            .foregroundColor(AppColor.Label.base2)
        }
      }
    }
  }
}
