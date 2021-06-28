// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cloudloop",
    platforms: [.macOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
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
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/OperatorFoundation/Gardener", from: "0.0.41"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Cloudloop",
            dependencies: [],
            exclude: ["README.md"]
        ),
        .target(
            name: "CloudloopTemplate",
            dependencies: []),
        .target(
            name: "Generate",
            dependencies: ["CloudloopTemplate", "Gardener"]),
        .target(
            name: "CloudloopSbd",
            dependencies: ["Cloudloop"]),
        .testTarget(
            name: "CloudloopTests",
            dependencies: ["Cloudloop", "CloudloopSbd"],
            exclude: ["Examples"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
