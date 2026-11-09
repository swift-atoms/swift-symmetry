# swift-symmetry

Use this package when you need a rotation or shear held as the plain numbers of its N by N matrix, or a rotation by a whole number of quarter turns. Start from `Rotation<N, Scalar>`, `Shear<N, Scalar>` or `Phase`. If you want a rotation recorded as ordered steps in coordinate planes, without multiplying anything out, use swift-rotation. For one validated shear of a single axis along another, use swift-shear. For per-axis scale factors, use swift-scale. For quarter turns alongside angles in radians and degrees, use swift-angle.

## Laws

- `Rotation.init(cos:sin:)` sets `matrix[0]` to `cos, -sin` and `matrix[1]` to `sin, cos`, so a positive sine turns counterclockwise.
- `Rotation.identity` has ones on the diagonal. `Shear.identity` has every factor zero, because `Shear.factors` holds only the amounts of shear and not the matrix itself.
- `Shear.x` is `factors[0][1]` and `Shear.y` is `factors[1][0]`. The diagonal of `factors` is always zero: `Shear.init(_:)` sets it to zero, so in two dimensions `x` and `y` are the whole value that equality, hashing and coding use.
- A two dimensional `Rotation` encodes as the keys `a`, `b`, `c`, `d`, which are `matrix[0][0]`, `matrix[0][1]`, `matrix[1][0]` and `matrix[1][1]`. A two dimensional `Shear` encodes as the keys `x` and `y`.
- `Phase` encodes as its raw value, the number of quarter turns from 0 to 3, not as degrees.
- `Phase.init(degrees:)` reduces any whole number of degrees, of either sign, modulo 360 and returns nil unless the result is a multiple of 90. So -90 degrees gives `Phase.threeQuarter`, and `Phase.degrees` always lies in 0 to 270.
