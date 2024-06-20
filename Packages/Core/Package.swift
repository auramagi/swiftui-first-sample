// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v16), .macOS(.v13), .watchOS(.v9)],
    products: [
        .library(name: "Core", targets: ["Core"]),
        .library(name: "CommonUI", targets: ["CommonUI"]),
        .library(name: "AppUI", targets: ["AppUI"]),
        .library(name: "WatchUI", targets: ["WatchUI"]),
        .library(name: "DogAPI", targets: ["DogAPI"]),
        .library(name: "RealmStorage", targets: ["RealmStorage"]),
        .library(name: "CommonServices", targets: ["CommonServices"]),
        .library(name: "AppServices", targets: ["AppServices"]),
        .library(name: "WatchServices", targets: ["WatchServices"]),
        .library(name: "LiveApp", targets: ["LiveApp"]),
        .library(name: "LiveWatch", targets: ["LiveWatch"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift", from: "10.47.0"),
    ],
    targets: [
        // MARK: Core

        .target(
            name: "Core"
        ),

        // MARK: UI

        .target(
            name: "PreviewAssets",
            dependencies: ["Core"],
            exclude: ["_PreviewAssets.xcassets"]
        ),
        .target(
            name: "CommonUI",
            dependencies: ["Core", "PreviewAssets"]
        ),
        .target(
            name: "AppUI", 
            dependencies: ["Core", "PreviewAssets", "CommonUI"]
        ),
        .target(
            name: "WatchUI",
            dependencies: ["Core", "PreviewAssets", "CommonUI"]
        ),
        
        // MARK: Infrastructure
        
        .target(
            name: "DogAPI",
            dependencies: ["Core"]
        ),
        .target(
            name: "RealmStorage",
            dependencies: [
                "Core",
                .product(name: "RealmSwift", package: "realm-swift"),
            ]
        ),

        // MARK: Services

        .target(
            name: "CommonServices", 
            dependencies: ["Core"]
        ),
        .target(
            name: "AppServices",
            dependencies: ["Core", "CommonServices", "AppUI", "DogAPI", "RealmStorage"]
        ),
        .target(
            name: "WatchServices",
            dependencies: ["Core", "CommonServices", "WatchUI"]
        ),
        
        // MARK: Live containers
        
        .target(
            name: "LiveApp",
            dependencies: ["Core", "AppUI", "CommonServices", "AppServices", "DogAPI", "RealmStorage"]
        ),
        .target(
            name: "LiveWatch",
            dependencies: ["Core", "WatchUI", "CommonServices", "WatchServices", "DogAPI"]
        ),
    ]
)
