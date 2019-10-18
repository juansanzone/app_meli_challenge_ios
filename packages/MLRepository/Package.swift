// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLRepository",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "MLRepository", targets: [
            "MLRepository",
        ]),
    ],
    dependencies: [
        .package(path: "../MLTools"),
    ],
    targets: [
        .target(name: "MLRepository", dependencies: [
            "MLTools"
        ]),
        .testTarget(name: "MLRepositoryTests", dependencies: [
            "MLRepository"
        ]),
    ]
)
