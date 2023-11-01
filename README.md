# UIKitConfiguration

[![Swift](https://img.shields.io/badge/Swift-5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS_-yellowgreen?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/twitter-@sakiyamaK-blue.svg?style=flat-square)](https://twitter.com/sakiyamaK)

UIKitのパラメータを共通化のConfigurationで設定できるライブラリです

This library allows you to set UIKit parameters in a common Configuration.


```swift
import UIKit
import UIKitConfiguration

// setup UILabel Configuration
var labelConfiguration = UILabel.UIKitConfiguration()
labelConfiguration[\.textColor] = .white
labelConfiguration[\.font] = UIFont.systemFont(ofSize: 18, weight: .bold)
labelConfiguration[\.numberOfLines] = 0
labelConfiguration[\.backgroundColor] = .black

// apply UILabelConfiguration to UILabel
let label1 = UILabel(configuration: labelConfiguration)
label1.text = "label1 with labelConfiguration applied."

let label2 = UILabel(configuration: labelConfiguration)
label2.text = "label2 with labelConfiguration applied."

// setup UIImageView Configuration
var imageViewConfiguration = UIImageView.UIKitConfiguration()
imageViewConfiguration[\.backgroundColor] = .black
imageViewConfiguration[\.contentMode] = .scaleAspectFit
imageViewConfiguration[\.image] = UIImage(systemName: "swift")

// apply UIImageViewConfiguration to UIImageView
let imageView1 = UIImageView(configuration: imageViewConfiguration)
let imageView2 = UIImageView(configuration: imageViewConfiguration)

// Various other classes of UIKitConfiguration are available...
```

* [Installation](#installation)
  * [Swift Package Manager](#swift-package-manager)
  * [CocoaPods](#cocoapods)

## Installation

### Swift Package Manager

Once you have your Swift package set up, adding ObservableUIKit as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/sakiyamaK/UIKitConfiguration", .upToNextMajor(from: "0.0.1"))
]
```

To install ObservableUIKit package via Xcode

Go to File -> Swift Packages -> Add Package Dependency...
Then search for https://github.com/sakiyamaK/UIKitConfiguration
And choose the version you want

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate ObservableUIKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'UIKitConfiguration'
```
