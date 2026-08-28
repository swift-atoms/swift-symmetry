public struct Rotation<let N: Int, Scalar> {

    public var matrix: InlineArray<N, InlineArray<N, Scalar>>

    @inlinable
    public init(matrix: consuming InlineArray<N, InlineArray<N, Scalar>>) {
        self.matrix = matrix
    }
}

extension Rotation: Sendable where Scalar: Sendable {}

extension Rotation: Equatable where N == 2, Scalar: Equatable {

    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.matrix[0][0] == rhs.matrix[0][0] && lhs.matrix[0][1] == rhs.matrix[0][1]
            && lhs.matrix[1][0] == rhs.matrix[1][0] && lhs.matrix[1][1] == rhs.matrix[1][1]
    }
}

extension Rotation: Hashable where N == 2, Scalar: Hashable {

    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(matrix[0][0])
        hasher.combine(matrix[0][1])
        hasher.combine(matrix[1][0])
        hasher.combine(matrix[1][1])
    }
}

#if !hasFeature(Embedded)
    extension Rotation: Codable where N == 2, Scalar: Codable, Scalar: BinaryFloatingPoint {

        private enum CodingKeys: String, CodingKey {
            case a, b, c, d
        }

        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let a = try container.decode(Scalar.self, forKey: .a)
            let b = try container.decode(Scalar.self, forKey: .b)
            let c = try container.decode(Scalar.self, forKey: .c)
            let d = try container.decode(Scalar.self, forKey: .d)
            var m = InlineArray<2, InlineArray<2, Scalar>>(
                repeating: InlineArray<2, Scalar>(repeating: .zero)
            )
            m[0][0] = a
            m[0][1] = b
            m[1][0] = c
            m[1][1] = d
            self.init(matrix: m)
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(matrix[0][0], forKey: .a)
            try container.encode(matrix[0][1], forKey: .b)
            try container.encode(matrix[1][0], forKey: .c)
            try container.encode(matrix[1][1], forKey: .d)
        }
    }
#endif

extension Rotation where Scalar: ExpressibleByIntegerLiteral {

    @inlinable
    public static var identity: Self {
        var m = InlineArray<N, InlineArray<N, Scalar>>(
            repeating: InlineArray<N, Scalar>(repeating: 0)
        )
        (0..<N).forEach { i in
            m[i][i] = 1
        }
        return Self(matrix: m)
    }
}

extension Rotation where N == 2, Scalar: SignedNumeric {

    @inlinable
    public init(cos: Scalar, sin: Scalar) {
        var m = InlineArray<2, InlineArray<2, Scalar>>(
            repeating: InlineArray<2, Scalar>(repeating: .zero)
        )
        m[0][0] = cos
        m[0][1] = -sin
        m[1][0] = sin
        m[1][1] = cos
        self.init(matrix: m)
    }
}
