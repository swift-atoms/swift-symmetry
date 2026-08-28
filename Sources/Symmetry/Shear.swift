public struct Shear<let N: Int, Scalar: FloatingPoint> {

    public var factors: InlineArray<N, InlineArray<N, Scalar>>

    @inlinable
    public init(_ factors: consuming InlineArray<N, InlineArray<N, Scalar>>) {
        self.factors = factors
    }
}

extension Shear: Sendable where Scalar: Sendable {}

extension Shear: Equatable where N == 2 {

    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Shear: Hashable where N == 2, Scalar: Hashable {

    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

#if !hasFeature(Embedded)
    extension Shear: Codable where N == 2, Scalar: Codable {

        private enum CodingKeys: String, CodingKey {
            case x, y
        }

        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let x = try container.decode(Scalar.self, forKey: .x)
            let y = try container.decode(Scalar.self, forKey: .y)
            self.init(x: x, y: y)
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(x, forKey: .x)
            try container.encode(y, forKey: .y)
        }
    }
#endif

extension Shear where Scalar: ExpressibleByIntegerLiteral {

    @inlinable
    public static var identity: Self {
        Self(InlineArray(repeating: InlineArray(repeating: 0)))
    }
}

extension Shear where N == 2 {

    @inlinable
    public var x: Scalar {
        get { factors[0][1] }
        set { factors[0][1] = newValue }
    }

    @inlinable
    public var y: Scalar {
        get { factors[1][0] }
        set { factors[1][0] = newValue }
    }

    @inlinable
    public init(x: Scalar, y: Scalar) where Scalar: ExpressibleByIntegerLiteral {
        var matrix = InlineArray<2, InlineArray<2, Scalar>>(
            repeating: InlineArray<2, Scalar>(repeating: 0)
        )
        matrix[0][1] = x
        matrix[1][0] = y
        self.init(matrix)
    }

}
