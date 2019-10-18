// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLDomain",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "MLDomain", targets: [
            "MLDomain"
        ]),
    ],
    dependencies: [
        .package(path: "../MLRepository"),
        .package(path: "../MLNetworking")
    ],
    targets: [
        .target(name: "MLDomain",dependencies: [
            "MLRepository",
            "MLRepository",
        ]),
        .testTarget(name: "MLDomainTests",dependencies: [
            "MLDomain",
            "MLNetworking"
        ]),
    ]
)
