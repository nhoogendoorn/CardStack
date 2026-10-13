// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "CardStack",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "CardStack",
            targets: ["CardStack"])
    ],
    targets: [
        .target(
            name: "CardStack",
            resources: [.process("Resources")]),
        .testTarget(
            name: "CardStackTests",
            dependencies: ["CardStack"])
    ]
)
