// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLNetworking",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "MLNetworking", targets: [
            "MLNetworking",
        ]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "MLNetworking", dependencies: [
            
        ]),
        .testTarget(name: "MLNetworkingTests", dependencies: [
            "MLNetworking",
        ]),
    ]
)
