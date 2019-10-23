// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLLogging",
    products: [
        .library(name: "MLLogging", targets: [
            "MLLogging",
        ]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "MLLogging", dependencies: [
            "Logging",
        ]),
        .testTarget(name: "MLLoggingTests", dependencies: ["MLLogging"]),
    ]
)
