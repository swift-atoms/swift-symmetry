public import Symmetry

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
