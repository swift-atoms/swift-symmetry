internal import Cardinal_Primitives
public import Finite_Primitives
import Ordinal_Primitives
public import Pair_Primitives

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

extension Phase {

    public typealias Value<Payload> = Pair<Phase, Payload>
}

extension Phase: Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 4 }

    @inlinable
    public var ordinal: Ordinal { Ordinal(UInt(rawValue)) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        guard let value = Phase(rawValue: Int(ordinal.rawValue)) else {
            preconditionFailure("Phase ordinal is always in 0...3")
        }
        self = value
    }
}

#if !hasFeature(Embedded)
    extension Phase: Codable {}
#endif
