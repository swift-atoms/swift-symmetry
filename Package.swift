// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-symmetry",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Symmetry",
            targets: ["Symmetry"]
        ),
        .library(
            name: "Symmetry Standard Library Integration",
            targets: ["Symmetry Standard Library Integration"]
        ),
        .library(
            name: "Symmetry Apple Foundation Integration",
            targets: ["Symmetry Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Symmetry",
            dependencies: []
        ),
        .target(
            name: "Symmetry Standard Library Integration",
            dependencies: ["Symmetry"]
        ),
        .target(
            name: "Symmetry Apple Foundation Integration",
            dependencies: [
                "Symmetry",
                "Symmetry Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Symmetry Tests",
            dependencies: ["Symmetry"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
