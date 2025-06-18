// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Memoization",
  products: [
    .library(
      name: "Memoization",
      targets: ["Memoization"]
    )
  ],
  targets: [
    .target(
      name: "Memoization"),
    .testTarget(
      name: "MemoizationTests",
      dependencies: ["Memoization"]
    )
  ]
)
