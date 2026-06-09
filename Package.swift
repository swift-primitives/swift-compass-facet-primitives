// swift-tools-version: 6.3.1
import PackageDescription

let package = Package(
    name: "swift-compass-facet-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "Compass Facet Primitives", targets: ["Compass Facet Primitives"]),
        .library(name: "Compass Facet Primitives Test Support", targets: ["Compass Facet Primitives Test Support"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-compass-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-facet-primitives.git", branch: "main"),
    ],
    targets: [
        // Per-carrier bridge ([MOD-014], recipient-then-provider [PKG-NAME-016]):
        // Compass (recipient) gains its Facet<2> (provider) projection.
        .target(
            name: "Compass Facet Primitives",
            dependencies: [
                .product(name: "Compass Primitives", package: "swift-compass-primitives"),
                .product(name: "Facet Primitives", package: "swift-facet-primitives"),
            ]
        ),
        .target(
            name: "Compass Facet Primitives Test Support",
            dependencies: ["Compass Facet Primitives"],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Compass Facet Primitives Tests",
            dependencies: ["Compass Facet Primitives", "Compass Facet Primitives Test Support"]
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
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
