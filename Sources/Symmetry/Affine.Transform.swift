public import Affine_Geometry

extension Affine.Continuous.Transform where Scalar: BinaryFloatingPoint {

    @inlinable
    public init(_ rotation: Rotation<2, Scalar>) {
        self.init(linear: rotation.linear(), translation: .zero)
    }

    @inlinable
    public init(_ scale: Scale<2, Scalar>) {
        self.init(linear: scale.linear(), translation: .zero)
    }

    @inlinable
    public init(_ shear: Shear<2, Scalar>) {
        self.init(linear: shear.linear(), translation: .zero)
    }
}
