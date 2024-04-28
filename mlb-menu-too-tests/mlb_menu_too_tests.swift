import XCTest
@testable import mlb_menu_too

final class mlb_menu_too_tests: XCTestCase {
  func test_decode_game() throws {
    let sample = Fixtures.game

    let decoder = JSONDecoder()
    let data = try XCTUnwrap(sample.data(using: .utf8))
    let sampleGame = try decoder.decode(Game.self, from: data)

    XCTAssertNotNil(sampleGame)
  }
}
