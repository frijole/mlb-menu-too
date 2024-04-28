import XCTest
@testable import mlb_menu_too

final class mlb_menu_too_tests: XCTestCase {
  func test_decode_game() throws {
    let sample = Fixtures.game

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let data = try XCTUnwrap(sample.data(using: .utf8))
    let sampleGame = try decoder.decode(Game.self, from: data)

    XCTAssertNotNil(sampleGame)
    
    XCTAssertEqual(sampleGame.status.detailedState, "Scheduled")

    XCTAssertNil(sampleGame.teams.home.score)
    XCTAssertNil(sampleGame.teams.away.score)
  }
  
  func test_decode_game_in_progress() throws {
    let sample = Fixtures.gameInProgress

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let data = try XCTUnwrap(sample.data(using: .utf8))
    let sampleGame = try decoder.decode(Game.self, from: data)

    XCTAssertEqual(sampleGame.status.detailedState, "In Progress")

    XCTAssertNotNil(sampleGame.teams.home.score)
    XCTAssertNotNil(sampleGame.teams.away.score)
  }
  
  func test_decode_gameday() throws {
    let sample = Fixtures.maximumResponse
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let data = try XCTUnwrap(sample.data(using: .utf8))
    
    let decodedSchedule = try decoder.decode(Response.self, from: data)
    
    XCTAssertNotNil(decodedSchedule)

    let gameday = try XCTUnwrap(decodedSchedule.dates.first)
    XCTAssertEqual(gameday.games.count, 15)
  }
}
