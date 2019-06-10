// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WolfValidation",
    platforms: [
        .iOS(.v12), .macOS(.v10_14), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "WolfValidation",
            targets: ["WolfValidation"]),
        ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfCore", .branch("Swift-5.1")),
        .package(url: "https://github.com/wolfmcnally/WolfLocale", .branch("Swift-5.1")),
        .package(url: "https://github.com/wolfmcnally/WolfNIO", .branch("Swift-5.1")),
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
