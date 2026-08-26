# Symmetry

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Symmetry primitives for Swift — dimensionless geometric transformations (shear and discrete 90° rotational phases) generic over scalar type. Foundation-free and Embedded-compatible.

## Installation

Add the dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-symmetry.git", branch: "main")
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
