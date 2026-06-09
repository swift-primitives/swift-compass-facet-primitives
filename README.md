# swift-compass-facet-primitives

The lossless projection between `Compass.Cardinal` and its `Facet<2>` carrier.

A per-carrier bridge ([MOD-014]): the bare `Compass.Cardinal` enum carries no `Facet`
dependency; this package adds `.facet` (and the reverse `init(facet:)`) for consumers who
want the projection.

```swift
import Compass_Facet_Primitives

Compass.Cardinal.north.facet            // Facet<2>(axis: .secondary, direction: .positive)
Compass.Cardinal(facet: someFacet)      // the matching bearing
```

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
