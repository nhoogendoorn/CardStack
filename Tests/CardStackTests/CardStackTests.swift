import XCTest
@testable import CardStack

final class CardStackTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CardStack().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
