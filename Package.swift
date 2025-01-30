// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScClient",
    products: [
        .library(
            name: "ScClient",
            targets: ["ScClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream.git", .exact("3.1.1")),
        .package(url: "https://github.com/symplicity/HandyJSON.git", .exact("5.0.6")),
        .package(url: "https://github.com/Quick/Quick.git", .exact("2.2.1")),
        .package(url: "https://github.com/Quick/Nimble.git", .exact("8.0.9")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")
        ],
    targets: [
        .target(
            name: "ScClient",
            dependencies: [
                "Starscream",
                "HandyJSON"
                ]),
        .target(
            name: "Main",
            dependencies: [
                "ScClient",
                ]),
        .testTarget(
            name: "Integration",
            dependencies: [
                "ScClient",
                "Quick",
                "Nimble",
                "RxSwift"
                ]),
        .testTarget(
            name: "Unit",
            dependencies: [
                "ScClient"
                ])
        ]
)
