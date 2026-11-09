import Foundation
import Testing

@testable import Symmetry

extension `Symmetry Tests`.`Edge Case` {

    @Test
    func `Shear diagonal is always zero`() {
        var matrix = InlineArray<2, InlineArray<2, Double>>(
            repeating: InlineArray<2, Double>(repeating: 0)
        )
        matrix[0][0] = 5
        matrix[0][1] = 2
        matrix[1][0] = 3
        matrix[1][1] = 7
        let shear = Shear<2, Double>(matrix)

        #expect(shear.factors[0][0] == 0)
        #expect(shear.factors[1][1] == 0)
        #expect(shear.x == 2)
        #expect(shear.y == 3)
        #expect(shear == Shear<2, Double>(x: 2, y: 3))
    }

    @Test
    func `Shear coding round-trips the whole value`() throws {
        var matrix = InlineArray<2, InlineArray<2, Double>>(
            repeating: InlineArray<2, Double>(repeating: 1)
        )
        matrix[0][1] = 2
        matrix[1][0] = -4
        let shear = Shear<2, Double>(matrix)

        let data = try JSONEncoder().encode(shear)
        let decoded = try JSONDecoder().decode(Shear<2, Double>.self, from: data)

        #expect(decoded == shear)
        #expect(decoded.factors[0][0] == shear.factors[0][0])
        #expect(decoded.factors[0][1] == shear.factors[0][1])
        #expect(decoded.factors[1][0] == shear.factors[1][0])
        #expect(decoded.factors[1][1] == shear.factors[1][1])
    }
}
