// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLAutosuggest",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "MLAutosuggest", targets: [
            "MLAutosuggest",
        ]),
    ],
    dependencies: [
        .package(path: "../MLDomain"),
        .package(path: "../MLRepository"),
        .package(path: "../MLNetworking"),
    ],
    targets: [
        .target(name: "MLAutosuggest", dependencies: [
            "MLDomain",
            "MLRepository",
        ]),
        .testTarget(name: "MLAutosuggestTests", dependencies: [
            "MLAutosuggest",
            "MLDomain",
            "MLRepository",
            "MLNetworking"
        ]),
    ]
)

