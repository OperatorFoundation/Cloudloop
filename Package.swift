// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cloudloop",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "Cloudloop",
            targets: ["Cloudloop"]),
        .library(
            name: "CloudloopTemplate",
            targets: ["CloudloopTemplate"]),
        .executable(
            name: "Generate",
            targets: ["Generate"]),
        .library(
            name: "CloudloopSbd",
            targets: ["CloudloopSbd"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OperatorFoundation/Gardener", branch: "main"),
    ],
    targets: [
        .target(
            name: "Cloudloop",
            dependencies: [],
            exclude: ["README.md"]
        ),
        .target(
            name: "CloudloopTemplate",
            dependencies: []),
        .executableTarget(
            name: "Generate",
            dependencies: ["CloudloopTemplate", "Gardener"]),
        .target(
            name: "CloudloopSbd",
            dependencies: ["Cloudloop"]),
        .testTarget(
            name: "CloudloopTests",
            dependencies: ["Cloudloop", "CloudloopSbd"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
