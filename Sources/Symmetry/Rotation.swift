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
