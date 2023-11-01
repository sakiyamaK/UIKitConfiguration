// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitConfiguration",
    platforms: [
        .iOS(.v14),
        ],
    products: [
       .library(
            name: "UIKitConfiguration",
            targets: ["UIKitConfiguration"]),
    ],
    targets: [
        .target(name: "UIKitConfiguration", path: "Sources"),
        .testTarget(
            name: "UIKitConfigurationTests",
            dependencies: ["UIKitConfiguration"]),
    ]
)
