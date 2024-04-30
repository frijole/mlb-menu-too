import Foundation

class Scoreboard {
  private var status: Status = .idle
  
  var games: [Response.Game] {
    if case let .loaded(response) = status,
       let gameday = response.dates.first {
      return gameday.games
    }
    return [Response.Game]()
  }
  
  func fetch(completion: @escaping (Status) -> Void) async {
    /*
    if useFixture {
      do {
        let sample = Fixtures.maximumResponse.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let content = try decoder.decode(Response.self, from: sample)
        status = .loaded(content)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
          completion(.loaded(content))
        })
      } catch {
        print("lol wut")
        return
      }
      return
    }
    */
    
    guard let url = URL(string: requestAddress) else {
      status = .error
      completion(.error)
      return
    }
        
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      let content = try decoder.decode(Response.self, from: data)
      print("got json: \(String(data: data, encoding: .utf8) ?? "none?")")
      // print("decoded content? \(content)")
      status = .loaded(content)
      completion(.loaded(content))
    } catch {
      print("caught error??")
      status = .error
      completion(.error)
    }
  }
  
  var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "startDate=YYYY-MM-DD&endDate=YYYY-MM-DD"
    return formatter
  }()
  
  var requestAddress: String {
    return "https://statsapi.mlb.com/api/v1/schedule?sportId=1&"
      + dateFormatter.string(from: Date())
      // + "hydrate=team,person,stats,seriesStatus(useOverride=true),linescore(matchup,runners)"
      + "hydrate=team,linescore(matchup,runners),xrefId,story,flags,statusFlags,broadcasts(all),venue(location),decisions,person,probablePitcher,stats,game(content(media(epg),summary),tickets),seriesStatus(useOverride=true)"
      + "&sortBy=gameDate,gameStatus,gameType"
  }
}

extension Scoreboard {
  enum Status {
    case idle
    case error
    case loading
    case loaded(Response)
  }
}

struct Response: Decodable {
//  "totalItems":15,
//  "totalEvents":0,
//  "totalGames":15,
//  "totalGamesInProgress":6,
//  "dates":[]
  let dates: [Gameday]
}

extension Response {
  struct Gameday: Decodable {
    let date: String // for display, not a date!
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
    let gameType: String // what is this?
    //  "season":"2024",
    let season: String
    //  "gameDate":"2024-04-28T20:10:00Z",
    let gameDate: Date
    //  "officialDate":"2024-04-28",
    let officialDate: String
    
    let status: Status
    let teams: Teams
    let venue: Venue
    
    // more (when hydrated?)
    let gameNumber: Int
    let publicFacing: Bool
    let doubleHeader: String // convert Y/N to bool
    let gamedayType: String
    let tiebreaker: String
    let calendarEventID: String
    let seasonDisplay: String
    let dayNight: String // make enum
    let scheduledInnings: Int
    let reverseHomeAwayStatus: Bool
    let inningBreakLength: Int // ":120"
    let gamesInSeries: Int
    let seriesGameNumber: Int
    let seriesDescription: String
    let recordSource: String
    let ifNecessary: String // convert Y/N to bool
    let ifNecessaryDescription: String
  }
  
  struct Teams: Decodable {
    let home: Team
    let away: Team
  }
  
  struct Venue: Decodable {
    //  "id":2680,
    //  "link":"/api/v1/venues/2680"
    let name: String // "Petco Park"
  }
  
  struct Status: Decodable {
    let abstractGameState: String // "Preview"
    let codedGameState: String // "S" // decode to enum??
    let detailedState: String // "Scheduled" / "In Progress" / ??
    let statusCode: String // "S"
    let startTimeTBD: Bool
    let abstractGameCode: String // "P"
  }
}

extension Response {
  struct Team: Decodable {
    //  "leagueRecord": {"wins":18,"losses":10,"pct":".643"},
    //  "team": {"id":143,"name":"Philadelphia Phillies","link":"/api/v1/teams/143"},
    //  "splitSquad":false,
    //  "seriesNumber":9
    let teamID: Int
    let info: MLBTeam
    let score: Int?
    
    enum CodingKeys: String, CodingKey {
      case `id`
      case name
      case team
      case score
    }
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      score = try values.decodeIfPresent(Int.self, forKey: .score)
      
      let team = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .team)
      info = try team.decode(MLBTeam.self, forKey: .name)
      teamID = try team.decode(Int.self, forKey: .id)
    }
  }
}

extension Response {
  struct Event: Decodable {}
}
