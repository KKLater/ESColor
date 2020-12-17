// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ESColor",
    platforms: [.iOS(.v8), .macOS(.v10_10), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "ESColor", targets: ["ESColor"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ESColor", dependencies: []),
        .testTarget(name: "ESColorTests", dependencies: ["ESColor"]),
    ]
)
