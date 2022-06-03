// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

import PackageDescription

let package = Package(
    name: "AFoundation",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "AFoundation",
            targets: [
                "AFoundation"
            ]
        )
    ],
    targets: [
        .target(
            name: "AFoundation",
            path: "AFoundation",
            exclude:[
                "Info.plist"
            ]
        )
    ]
)
