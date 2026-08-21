public import Dimension_Primitives
public import Linear_Primitives

extension Scale where N == 2, Scalar: ExpressibleByIntegerLiteral {

    @inlinable
    public func linear<Space>() -> Linear<Scalar, Space>.Matrix<2, 2> {
        .init(a: x, b: 0, c: 0, d: y)
    }
}
