// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HIDCore",
    platforms: [.macOS(.v14)],
    products: [.library(name: "HIDCore", targets: ["HIDCore"])],
    targets: [
        .systemLibrary(name: "Chidapi", path: "Sources/Chidapi", pkgConfig: "hidapi", providers: [.brewItem(["hidapi"])]),
        .target(name: "HIDCore", dependencies: [.target(name: "Chidapi")])
    ]
)
