// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "SPAlert",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SPAlert",
            targets: ["SPAlert"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SPAlert",
            swiftSettings: [
                .define("SPPALERT_SPM")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)

