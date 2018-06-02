# GradientAnimationView

[![Language](https://img.shields.io/badge/language-Swift%204.0-orange.svg)](https://swift.org)
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/komaji/GradientAnimationView/blob/master/LICENSE)

GradientAnimationView is a simple way to create gradient effect with sliding animation.

<img alt="demo.gif" src="https://github.com/komaji/GradientAnimationView/blob/master/Demo/demo.gif" width="375">

## Usage

```swift
let gradientAnimationView = GradientAnimationView()

// These are options
gradientAnimationView.cornerRadius = 5.0
gradientAnimationView.sideColor = .gray
gradientAnimationView.centerColor = .lightGray
gradientAnimationView.animationDuration = 1.2
gradientAnimationView.waitingDuration = 0.6

view.addSubview(gradientAnimationView)
```

## Requirements

- iOS 11.0
- Xcode 9.2
- Swift 4.0

## Installation

### [Carthage](https://github.com/Carthage/Carthage)

Add this to your Cartfile:

```
github "komaji/GradientAnimationView"
```

Then, run the following command:

```sh
$ carthage update
```

## License

[MIT](https://github.com/komaji/GradientAnimationView/blob/master/LICENSE)
