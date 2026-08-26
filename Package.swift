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
            name: "Symmetry Test Support",
            targets: ["Symmetry Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-linear.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-algebra.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-pair.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-affine.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-affine-geometry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-finite.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-numeric.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ordinal.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Symmetry",
            dependencies: [
                .product(name: "Linear", package: "swift-linear"),
                .product(name: "Algebra Group", package: "swift-algebra"),
                .product(name: "Pair", package: "swift-pair"),
                .product(name: "Affine", package: "swift-affine"),
                .product(
                    name: "Affine Geometry",
                    package: "swift-affine-geometry"
                ),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Finite", package: "swift-finite"),
                .product(name: "Real", package: "swift-numeric"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
        ),
        .target(
            name: "Symmetry Test Support",
            dependencies: [
                "Symmetry",
                .product(
                    name: "Cardinal Test Support",
                    package: "swift-cardinal"
                ),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Symmetry Tests",
            dependencies: [
                "Symmetry",
                "Symmetry Test Support",
            ]
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
