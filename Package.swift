// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCAFootballDataClient",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "XCAFootballDataClient",
            targets: ["XCAFootballDataClient"]),
    ],
    targets: [
        .target(
            name: "XCAFootballDataClient")
    ]
)
