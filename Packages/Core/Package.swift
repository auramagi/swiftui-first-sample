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
        .library(name: "CommonServices", targets: ["CommonServices"]),
        .library(name: "AppServices", targets: ["AppServices"]),
        .library(name: "WatchServices", targets: ["WatchServices"]),
        .library(name: "LiveApp", targets: ["LiveApp"]),
        .library(name: "LiveWatch", targets: ["LiveWatch"]),
    ],
    targets: [
        // MARK: Core
        .target(
            name: "Core"
        ),
        .target(
            name: "PreviewAssets",
            exclude: ["_PreviewAssets.xcassets"]
        ),
        
        // MARK: UI
        
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
        
        // MARK: Services
        
        .target(
            name: "DogAPI",
            dependencies: ["Core"]
        ),
        
        .target(
            name: "CommonServices", 
            dependencies: ["Core"]
        ),
        .target(
            name: "AppServices",
            dependencies: ["Core", "CommonServices", "AppUI", "DogAPI"]
        ),
        .target(
            name: "WatchServices",
            dependencies: ["Core", "CommonServices", "WatchUI"]
        ),
        
        // MARK: Live containers
        
        .target(
            name: "LiveApp",
            dependencies: ["Core", "AppUI", "CommonServices", "AppServices", "DogAPI"]
        ),
        .target(
            name: "LiveWatch",
            dependencies: ["Core", "WatchUI", "CommonServices", "WatchServices", "DogAPI"]
        ),
    ]
)
