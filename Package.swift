// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GAMigration",
    platforms: [
      .macOS(.v14),
      .iOS(.v17),
    ],
    products: [
        .library(
            name: "GAMigration",
            targets: ["GAMigration"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.20.1"),
      .package(url: "https://github.com/norio-nomura/Base32", .upToNextMajor(from: "0.9.0")),
    ],
    targets: [
      .target(
         name: "GAMigration",
         dependencies: [ .product(name: "SwiftProtobuf", package: "swift-protobuf"), .product(name: "Base32", package: "Base32") ]),
      .testTarget(
         name: "GAMigrationTests",
         dependencies: ["GAMigration"]),
    ]
)

 
