import Testing

@testable import Symmetry_Primitives

@Suite
struct `Symmetry Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}

    @Test
    func `Symmetry is an enum namespace`() {

        let typeName = String(describing: Symmetry.self)
        #expect(typeName == "Symmetry")
    }
}
