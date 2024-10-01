// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PerplexityApiSwift",
    platforms: [
        // Only add support for iOS 16 and up.
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PerplexityApiSwift",
            targets: ["PerplexityApiSwift"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PerplexityApiSwift"),
        .testTarget(
            name: "PerplexityApiSwiftTests",
            dependencies: ["PerplexityApiSwift"]
        ),
    ]
)
