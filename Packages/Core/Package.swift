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
        .library(name: "CommonServices", targets: ["CommonServices"]),
        .library(name: "AppServices", targets: ["AppServices"]),
        .library(name: "WatchServices", targets: ["WatchServices"]),
        .library(name: "DogAPI", targets: ["DogAPI"]),
        .library(name: "LiveApp", targets: ["LiveApp"]),
        .library(name: "LiveWatch", targets: ["LiveWatch"]),
    ],
    targets: [
        .target(
            name: "Core"
        ),
        
        .target(
            name: "CommonUI",
            dependencies: ["Core"]
        ),
        .target(
            name: "AppUI", 
            dependencies: ["Core", "CommonUI"]
        ),
        .target(
            name: "WatchUI",
            dependencies: ["Core", "CommonUI"]
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
        
        .target(
            name: "DogAPI",
            dependencies: ["Core"]
        ),
        
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
