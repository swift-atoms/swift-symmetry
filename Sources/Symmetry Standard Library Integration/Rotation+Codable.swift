public import Symmetry

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
