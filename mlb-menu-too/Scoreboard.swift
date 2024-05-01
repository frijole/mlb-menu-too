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
    } catch let error {
      print("caught error: \(error)")
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
      // + "&hydrate=team,linescore(matchup,runners),person,stats,seriesStatus(useOverride=true),venue(location),stats,game"
      // + "&hydrate=team,linescore(matchup,runners),xrefId,story,flags,statusFlags,broadcasts(all),venue(location),decisions,person,probablePitcher,stats,game(content(media(epg),summary),tickets),seriesStatus(useOverride=true)"
      // + "&sortBy=gameDate,gameStatus,gameType"

      // straight from production
      + "&hydrate=team,linescore(matchup,runners),xrefId,story,flags,statusFlags,broadcasts(all),venue(location),decisions,person,probablePitcher,stats,game(content(media(epg),summary),tickets),seriesStatus(useOverride=true)&sortBy=gameDate,gameStatus,gameType"
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
    
    let linescore: Linescore?
    
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
    
    enum CodingKeys: CodingKey {
      case gameType
      case season
      case gameDate
      case officialDate
      case status
      case teams
      case venue
      case linescore
      case gameNumber
      case publicFacing
      case doubleHeader
      case gamedayType
      case tiebreaker
      case calendarEventID
      case seasonDisplay
      case dayNight
      case scheduledInnings
      case reverseHomeAwayStatus
      case inningBreakLength
      case gamesInSeries
      case seriesGameNumber
      case seriesDescription
      case recordSource
      case ifNecessary
      case ifNecessaryDescription
    }
    
    init(from decoder: any Decoder) throws {
      let container: KeyedDecodingContainer<Response.Game.CodingKeys> = try decoder.container(keyedBy: Game.CodingKeys.self)
      self.gameType = try container.decode(String.self, forKey: Response.Game.CodingKeys.gameType)
      self.season = try container.decode(String.self, forKey: Response.Game.CodingKeys.season)
      self.gameDate = try container.decode(Date.self, forKey: Response.Game.CodingKeys.gameDate)
      self.officialDate = try container.decode(String.self, forKey: Response.Game.CodingKeys.officialDate)
      self.status = try container.decode(Response.Status.self, forKey: Response.Game.CodingKeys.status)
      self.teams = try container.decode(Response.Teams.self, forKey: Response.Game.CodingKeys.teams)
      self.venue = try container.decode(Response.Venue.self, forKey: Response.Game.CodingKeys.venue)
      self.gameNumber = try container.decode(Int.self, forKey: Response.Game.CodingKeys.gameNumber)
      self.publicFacing = try container.decode(Bool.self, forKey: Response.Game.CodingKeys.publicFacing)
      self.doubleHeader = try container.decode(String.self, forKey: Response.Game.CodingKeys.doubleHeader)
      self.gamedayType = try container.decode(String.self, forKey: Response.Game.CodingKeys.gamedayType)
      self.tiebreaker = try container.decode(String.self, forKey: Response.Game.CodingKeys.tiebreaker)
      self.calendarEventID = try container.decode(String.self, forKey: Response.Game.CodingKeys.calendarEventID)
      self.seasonDisplay = try container.decode(String.self, forKey: Response.Game.CodingKeys.seasonDisplay)
      self.dayNight = try container.decode(String.self, forKey: Response.Game.CodingKeys.dayNight)
      self.scheduledInnings = try container.decode(Int.self, forKey: Response.Game.CodingKeys.scheduledInnings)
      self.reverseHomeAwayStatus = try container.decode(Bool.self, forKey: Response.Game.CodingKeys.reverseHomeAwayStatus)
      self.inningBreakLength = try container.decode(Int.self, forKey: Response.Game.CodingKeys.inningBreakLength)
      self.gamesInSeries = try container.decode(Int.self, forKey: Response.Game.CodingKeys.gamesInSeries)
      self.seriesGameNumber = try container.decode(Int.self, forKey: Response.Game.CodingKeys.seriesGameNumber)
      self.seriesDescription = try container.decode(String.self, forKey: Response.Game.CodingKeys.seriesDescription)
      self.recordSource = try container.decode(String.self, forKey: Response.Game.CodingKeys.recordSource)
      self.ifNecessary = try container.decode(String.self, forKey: Response.Game.CodingKeys.ifNecessary)
      self.ifNecessaryDescription = try container.decode(String.self, forKey: Response.Game.CodingKeys.ifNecessaryDescription)

      let linescoreContainer = try container.nestedContainer(keyedBy: Response.Linescore.CodingKeys.self, forKey: .linescore)
      if let _ = try linescoreContainer.decodeIfPresent(Int.self, forKey: .currentInning) {
        self.linescore = try container.decodeIfPresent(Response.Linescore.self, forKey: Response.Game.CodingKeys.linescore)
      } else {
        self.linescore = nil
      }
    }
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

enum Errors: Error {
    case decodingError(String)
}

extension Response {
  struct Linescore: Decodable {
    let currentInning: Int // "currentInning": 8,
    let currentInningOrdinal: String // "currentInningOrdinal": "8th",
    let inningState: InningState  // "inningState": "Middle",
    let inningHalf: String // "inningHalf": "Top",
    let isTopInning: Bool // "isTopInning": true,
    
    enum CodingKeys: String, CodingKey {
      case currentInning
      case currentInningOrdinal
      case inningState
      case inningHalf
      case isTopInning
    }
    
    init(from decoder: any Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      guard let inning = try values.decodeIfPresent(Int.self, forKey: .currentInning) else {
        throw Errors.decodingError("no inning")
      }
      currentInning = inning
      currentInningOrdinal = try values.decode(String.self, forKey: .currentInningOrdinal)
      inningState = try values.decode(InningState.self, forKey: .inningState)
      inningHalf = try values.decode(String.self, forKey: .inningHalf)
      isTopInning = try values.decode(Bool.self, forKey: .isTopInning)
    }
  }
}

extension Response {
  enum InningState: String, Decodable {
    case top = "Top"
    case middle = "Middle"
    case bottom = "Bottom"
    
    var shortName: String {
      switch self {
      case .top:
        return "Top"
      case .middle:
        return "Mid"
      case .bottom:
        return "Bot"
      }
    }
  }
}

extension Response {
  struct Event: Decodable {}
}
