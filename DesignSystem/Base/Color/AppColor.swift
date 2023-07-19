import Foundation
import SwiftUI

public enum AppColor {}

// MARK: AppColor.Background

extension AppColor {
  public enum Background {
    public static let base = Color("BgBase", bundle: BundleToken.bundle)
//    public static let base1 = Color("BgBase1", bundle: BundleToken.bundle)
//    public static let base2 = Color("BgBase2", bundle: BundleToken.bundle)
  }
}

// MARK: AppColor.Label

extension AppColor {
  public enum Label {
    public static let base = Color("LbBase", bundle: BundleToken.bundle)
    public static let base2 = Color("LbBase2", bundle: BundleToken.bundle)
    public static let base3 = Color("LbBase3", bundle: BundleToken.bundle)
  }
}

// MARK: AppColor.Tint

extension AppColor {
  public enum Tint {
    public static let primary = Color("TtPrimary", bundle: BundleToken.bundle)
    public static let secondary = Color("TtSecondary", bundle: BundleToken.bundle)
  }
}
