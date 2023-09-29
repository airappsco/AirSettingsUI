// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AirSettingsUI",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AirSettingsUI",
            targets: ["AirSettingsUI"])
    ],
    dependencies: [
        .package(url: "git@github.com:realm/SwiftLint.git", from: "0.0.1"),
        .package(url: "git@github.com:pointfreeco/swift-snapshot-testing.git", from: "1.11.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AirSettingsUI", plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "AirSettingsUITests",
            dependencies: [
                "AirSettingsUI",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
