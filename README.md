# CombineMarbleLogging

This repo is a part of the [CombineMarbleDebugger](https://github.com/vlad-mataringa/CombineMarbleDebugger) project, which is a debugging tool for the Swift Combine framework, based on logs.



### Swift Package Manager

CombineMarbleLogging support only [Swift Package Manager](https://github.com/swiftlang/swift-package-manager), you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) to instal it, using the URL for this repository:

1. In Xcode, select “File” → “Add Packages...”
2. Enter `https://github.com/vlad-mataringa/CombineMarbleLogging.git`

Or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/vlad-mataringa/CombineMarbleLogging", from: "1.0.0")
```

### Start logging

```swift

let myPublisher = PassthroughSubject<String, Never>()
        
let myCancelable = myPublisher
  .map { $0.uppercased() }
  .log("my publisher log")
  .sink { _ in }
```



