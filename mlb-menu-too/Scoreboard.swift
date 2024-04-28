import Foundation

struct Gameday: Decodable {
  let date: String
  let totalItems: Int
  let totalEvents: Int
  let totalGames: Int
  let totalGamesInProgress: Int
  
  let games: [Game]
  let events: [Event]
}

struct Game: Decodable {
  //  "gamePk":745428,
  //  "gameGuid":"33799d1a-4692-4e59-aa92-86844235d298",
  //  "link":"/api/v1.1/game/745428/feed/live",
  //  "gameType":"R",
  //  "season":"2024",
  let season: String
  //  "gameDate":"2024-04-28T20:10:00Z",
  let gameDate: String // make date
  //  "officialDate":"2024-04-28",
  let officialDate: String

  let status: Status
  let teams: Teams
  let venue: Venue
}

struct Teams: Decodable {
  let home: Team
  let away: Team
}

struct Venue: Decodable {
  //  "id":2680,
  //  "name":"Petco Park",
  let name: String
  //  "link":"/api/v1/venues/2680"
}

struct Status: Decodable {
  //  "abstractGameState":"Preview",
  //  "codedGameState":"S",
  //  "detailedState":"Scheduled",
  let detailedState: String
  //  "statusCode":"S",
  //  "startTimeTBD":false,
  //  "abstractGameCode":"P"
  let abstractGameState: String
}

struct Team: Decodable {
  //  "leagueRecord": {"wins":18,"losses":10,"pct":".643"},
  //  "team": {"id":143,"name":"Philadelphia Phillies","link":"/api/v1/teams/143"},
  //  "splitSquad":false,
  //  "seriesNumber":9
  let teamID: Int
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case `id`
    case name
    case team
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let team = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .team)
    name = try team.decode(String.self, forKey: .name)
    teamID = try team.decode(Int.self, forKey: .id)
  }
}

struct Event: Decodable {}
