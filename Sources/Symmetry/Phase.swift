public enum Phase: Int, Sendable, Hashable, CaseIterable {

    case zero = 0

    case quarter = 1

    case half = 2

    case threeQuarter = 3
}

extension Phase {

    @inlinable
    public var degrees: Int {
        rawValue * 90
    }

    @inlinable
    public init?(degrees: Int) {
        let normalized = ((degrees % 360) + 360) % 360
        guard normalized % 90 == 0 else { return nil }
        self.init(rawValue: normalized / 90)
    }
}
