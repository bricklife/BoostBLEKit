// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoostBLEKit",
    products: [
        .library(
            name: "BoostBLEKit",
            targets: ["BoostBLEKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BoostBLEKit",
            dependencies: []),
        .testTarget(
            name: "BoostBLEKitTests",
            dependencies: ["BoostBLEKit"]),
    ]
)
