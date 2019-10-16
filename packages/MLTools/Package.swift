// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLTools",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "MLTools", targets: [
            "MLTools"
        ]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "MLTools",dependencies: [
            
        ]),
        .testTarget(name: "MLToolsTests", dependencies: [
            "MLTools"
        ]),
    ]
)
