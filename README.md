# Compass Facet Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The lossless bridge between `Compass.Cardinal` bearings and their `Facet<2>` box-face carrier for Swift — a `.facet` projection and its `init(facet:)` inverse, with zero Foundation dependency.

---

## Quick Start

`Compass.Cardinal` is a named view over the four faces of a 2D box: a compass bearing (north / east / south / west) with its own identity. `Facet<2>` is the geometric carrier — an axis paired with a signed direction. This package is the lossless bridge between them, so a layer that reasons in bearings and a layer that reasons in box faces can hand values back and forth without losing meaning.

```swift
import Compass_Facet_Primitives

// A compass bearing names a signed face of a 2D box.
let bearing = Compass.Cardinal.north
let face = bearing.facet                           // +Y: Facet<2>(axis: .secondary, direction: .positive)

// The projection is lossless — recover the bearing from any 2D facet.
let recovered = Compass.Cardinal(facet: face)      // .north

// "Opposite" agrees on both sides of the bridge.
bearing.opposite.facet == bearing.facet.opposite   // true — flipping the bearing flips the facet
```

A single `import` surfaces all three pieces: the bearings (`Compass.Cardinal`, with `.opposite` / `.clockwise` / `.counterclockwise`) from `Compass Primitives`, the carrier (`Facet<2>`, with `.opposite`) from `Facet Primitives`, and the `.facet` / `init(facet:)` projection added here. The bare `Compass.Cardinal` enum carries no `Facet` dependency of its own — this bridge is what couples the two, for consumers who want the projection.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-compass-facet-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Compass Facet Primitives", package: "swift-compass-facet-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

A per-carrier bridge with two library products. Depends only on `Compass Primitives` and `Facet Primitives`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Compass Facet Primitives` | `Sources/Compass Facet Primitives/` | The `.facet` projection on `Compass.Cardinal` and its `init(facet:)` inverse; re-exports `Compass Primitives` and `Facet Primitives` so a single import surfaces the bearings, the carrier, and the bridge together. |
| `Compass Facet Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
