// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lsvm-swift",
    products: [
        .library(
            name: "LsvmLib",
            type: .dynamic,
            targets: ["LsvmLib"]
        ),
        .executable(name: "lsvm", targets: ["lsvm"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            from: "1.3.0"
        ),
        .package(
            url: "https://github.com/xiaoli-white/swift-utils",
            from: "0.1.1"
        ),
    ],
    targets: [
        .target(
            name: "LsvmLib",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "SwiftUtils", package: "swift-utils")
            ],
            linkerSettings: [
                .linkedLibrary("m")
            ]
        ),
        .executableTarget(
            name: "lsvm",
            dependencies: [
                "LsvmLib"
            ]
        ),
    ]
)
