// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "SurfSpotManagerrzApi",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "SurfSpotManagerrzApi", targets: ["SurfSpotManagerrzApi"]),
    .library(name: "SurfSpotManagerrzApiMock", targets: ["SurfSpotManagerrzApiMock"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "SurfSpotManagerrzApi",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "SurfSpotManagerrzApiMock",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "SurfSpotManagerrzApi"),
      ],
      path: "./SurfSpotManagerrzApiMock"
    ),
  ]
)
