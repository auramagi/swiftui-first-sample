// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Core",
    products: [
        .library(name: "Core", targets: ["Core"]),
        .library(name: "CommonUI", targets: ["CommonUI"]),
        .library(name: "AppUI", targets: ["AppUI"]),
        .library(name: "CommonServices", targets: ["CommonServices"]),
        .library(name: "AppServices", targets: ["AppServices"]),
        .library(name: "LiveApp", targets: ["LiveApp"]),
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
            name: "CommonServices", 
            dependencies: ["Core"]
        ),
        .target(
            name: "AppServices",
            dependencies: ["Core", "CommonServices"]
        ),
        
        .target(
            name: "LiveApp",
            dependencies: ["Core", "CommonServices", "AppServices"]
        ),
    ]
)
