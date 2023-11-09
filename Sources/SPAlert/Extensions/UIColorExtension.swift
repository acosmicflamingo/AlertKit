import UIKit

extension UIColor {
  /// Instantiate UIColor with support for high contrast mode
  /// - Parameters:
  ///   - light: color to use when userInterfaceStyle is light and normal contrast
  ///   - dark: color to use when userInterfaceStyle is dark and normal contrast
  ///   - lightHC: color to use when userInterfaceStyle is light and high contrast
  ///   - darkHC: color to use when userInterfaceStyle is dark and high contrast
  convenience init(
    light: UIColor,
    dark: UIColor,
    lightHC lightHighContrast: UIColor? = nil,
    darkHC darkHighContrast: UIColor? = nil
  ) {
    self.init { trait -> UIColor in
      let lightHC = lightHighContrast ?? light
      let darkHC = darkHighContrast ?? dark

      switch (trait.accessibilityContrast, trait.userInterfaceStyle) {
      case (.high, .dark):
        return darkHC.resolvedColor(with: trait)

      case (.high, _):
        return lightHC.resolvedColor(with: trait)

      case (_, .dark):
        return dark.resolvedColor(with: trait)

      default:
        return light.resolvedColor(with: trait)
      }
    }
  }
}
