# Symmetry

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Dependency-free symmetry concepts for Swift: rotations, shears, and discrete 90° phases. Linear, algebra, dimension, finite, pair, and affine-geometry behavior lives in focused `swift-symmetry-*` molecule packages.

## Installation

Add the dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-atoms/swift-symmetry.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Symmetry", package: "swift-symmetry")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
