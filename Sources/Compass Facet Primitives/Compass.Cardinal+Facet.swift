// Compass.Cardinal+Facet.swift
// Lossless projection between Compass.Cardinal and its Facet<2> carrier.

public import Compass_Primitives
public import Facet_Primitives

extension Compass.Cardinal {
    /// The 2D box facet this compass bearing names: north = +Y, east = +X, south = −Y,
    /// west = −X (axis 0 = X = primary, axis 1 = Y = secondary).
    @inlinable
    public var facet: Facet<2> {
        switch self {
        case .north: Facet(axis: .secondary, direction: .positive)
        case .east: Facet(axis: .primary, direction: .positive)
        case .south: Facet(axis: .secondary, direction: .negative)
        case .west: Facet(axis: .primary, direction: .negative)
        }
    }

    /// The cardinal direction corresponding to a 2D facet.
    @inlinable
    public init(facet: Facet<2>) {
        switch (facet.axis.underlying, facet.direction) {
        case (1, .positive): self = .north
        case (0, .positive): self = .east
        case (1, .negative): self = .south
        default: self = .west  // (0, .negative)
        }
    }
}
