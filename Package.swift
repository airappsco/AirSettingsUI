// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AirSettingsUI",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AirSettingsUI",
            targets: ["AirSettingsUI"]),
    ],
    dependencies: [
        .package(url: "git@github.com:realm/SwiftLint.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AirSettingsUI", plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]),
        .testTarget(
            name: "AirSettingsUITests",
            dependencies: ["AirSettingsUI"]),
    ]
)
