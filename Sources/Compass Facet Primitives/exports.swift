// exports.swift
// The bridge IS the Compass.Cardinal <-> Facet<2> integration point, so it re-exports both
// the named view and the carrier — `import Compass_Facet_Primitives` surfaces both plus the
// `.facet` projection ([PKG-DEP-003]).

@_exported public import Compass_Primitives
@_exported public import Facet_Primitives
