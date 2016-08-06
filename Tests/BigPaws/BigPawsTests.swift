import XCTest
@testable import BigPaws

class BigPawsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(BigPaws().text, "Hello, World!")
    }


    static var allTests : [(String, (BigPawsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
