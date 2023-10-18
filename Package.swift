// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "swift-markdown-ui",
  platforms: [
    .macOS(.v12),
    .iOS(.v15),
    .tvOS(.v15),
    .watchOS(.v8),
  ],
  products: [
    .library(
      name: "MarkdownUI",
      targets: ["MarkdownUI"]
    )
  ],
  targets: [
    .target(name: "cmark-gfm"),
    .target(
      name: "MarkdownUI",
      dependencies: ["cmark-gfm"]
    )
  ]
)
