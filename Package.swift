// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gh-get-enterprise-users",
    platforms: [
      .macOS(.v12),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/apollographql/apollo-ios.git", .upToNextMajor(from: "0.9.5")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "gh-get-enterprise-users",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ])
    ]
)
