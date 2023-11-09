// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

/// SPAlert: Represent icon wrapper.
/// Included default styles and can be custom image.
public enum SPAlertIconPreset: Equatable {
  case done
  case error
  case heart
  case spinner

  case custom(_ image: UIImage)
}

// Get view and haptic by Preset.

extension SPAlertIconPreset {
  public func createView() -> UIView {
    switch self {
    case .done: return SPAlertIconDoneView()
    case .error: return SPAlertIconErrorView()
    case .heart: return SPAlertIconHeartView()
    case .spinner: return SPAlertSpinnerView()
    case let .custom(image):
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      return imageView
    }
  }

  public var haptic: SPAlertHaptic {
    switch self {
    case .done: .success
    case .error: .error
    case .heart: .success
    case .spinner: .none
    case .custom: .none
    }
  }
}

// Get layout by preset.

extension SPAlertLayout {
  public convenience init() {
    self.init(
      iconSize: .init(width: 100, height: 100),
      margins: .init(top: 43, left: 16, bottom: 25, right: 16),
      spaceBetweenIconAndTitle: 41
    )
  }

  public static func message() -> SPAlertLayout {
    let layout = SPAlertLayout()
    layout.margins = UIEdgeInsets(top: 23, left: 16, bottom: 23, right: 16)
    return layout
  }

  public convenience init(for preset: SPAlertIconPreset) {
    switch preset {
    case .done:
      self.init(
        iconSize: .init(
          width: 112,
          height: 112
        ),
        margins: .init(
          top: 63,
          left: Self.defaultHorizontalInset,
          bottom: 29,
          right: Self.defaultHorizontalInset
        ),
        spaceBetweenIconAndTitle: 35
      )
    case .heart:
      self.init(
        iconSize: .init(
          width: 112,
          height: 77
        ),
        margins: .init(
          top: 49,
          left: Self.defaultHorizontalInset,
          bottom: 25,
          right: Self.defaultHorizontalInset
        ),
        spaceBetweenIconAndTitle: 35
      )
    case .error:
      self.init(
        iconSize: .init(
          width: 86,
          height: 86
        ),
        margins: .init(
          top: 63,
          left: Self.defaultHorizontalInset,
          bottom: 29,
          right: Self.defaultHorizontalInset
        ),
        spaceBetweenIconAndTitle: 39
      )
    case .spinner:
      self.init(
        iconSize: .init(
          width: 16,
          height: 16
        ),
        margins: .init(
          top: 58,
          left: Self.defaultHorizontalInset,
          bottom: 27,
          right: Self.defaultHorizontalInset
        ),
        spaceBetweenIconAndTitle: 39
      )
    case .custom:
      self.init(
        iconSize: .init(
          width: 100,
          height: 100
        ),
        margins: .init(
          top: 43,
          left: Self.defaultHorizontalInset,
          bottom: 25,
          right: Self.defaultHorizontalInset
        ),
        spaceBetweenIconAndTitle: 35
      )
    }
  }

  private static var defaultHorizontalInset: CGFloat { 16 }
}
