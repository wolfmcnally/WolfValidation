// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "WolfValidation",
    platforms: [
        .iOS(.v12), .macOS(.v10_13), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "WolfValidation",
            targets: ["WolfValidation"]),
        ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfCore", from: "5.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfLocale", from: "2.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfNIO", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "WolfValidation",
            dependencies: [
                "WolfCore",
                "WolfLocale",
                "WolfNIO",
            ])
        ]
)
