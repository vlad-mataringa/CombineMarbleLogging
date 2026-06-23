# CombineMarbleLogging

This repo is a part of the [CombineMarbleDebugger](https://github.com/vlad-mataringa/CombineMarbleDebugger) project, which is a debugging tool for the Swift Combine framework, based on logs.

This repo contains the shared code between:
- [CombineMarbleDebugger](https://github.com/vlad-mataringa/CombineMarbleDebugger), which is the debugging user interface.
- [CombineMarbleLogging](https://github.com/vlad-mataringa/CombineMarbleLogging), which is the logging library.

### Swift Package Manager

To install CombineMarbleLogging using [Swift Package Manager](https://github.com/swiftlang/swift-package-manager), you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for this repository:

1. In Xcode, select “File” → “Add Packages...”
2. Enter `https://github.com/vlad-mataringa/CombineMarbleLogging.git`

Or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "[https://github.com/vlad-mataringa/CombineMarbleLogging](https://github.com/vlad-mataringa/CombineMarbleLogging)", from: "1.0.0")
