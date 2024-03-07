// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AirSettingsUI",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AirSettingsUI",
            targets: ["AirSettingsUI"])
    ],
    dependencies: [
        .package(url: "git@github.com:pointfreeco/swift-snapshot-testing.git", from: "1.11.1"),
        .package(url: "git@github.com:airappsco/AirFonts.git", branch: "feature/ios-12-support")
    ],
    targets: [
        .target(
            name: "AirSettingsUI",
            dependencies: [
                .product(name: "AirFonts", package: "AirFonts")
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
