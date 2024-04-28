enum Fixtures {
  static var gameInProgress: String =
  """
  {
    "gamePk":747045,
    "gameGuid":"9406f148-3b20-45c1-9901-d2e5b6054c47",
    "link":"/api/v1.1/game/747045/feed/live",
    "gameType":"R",
    "season":"2024",
    "gameDate":"2024-04-28T17:35:00Z",
    "officialDate":"2024-04-28",
    "status":{
      "abstractGameState":"Live",
      "codedGameState":"I",
      "detailedState":"In Progress",
      "statusCode":"I",
      "startTimeTBD":false,
      "abstractGameCode":"L"
    },
    "teams":{
      "away":{
        "leagueRecord":{"wins":11,"losses":17,"pct":".393"},
        "score":5,
        "team":{"id":133,"name":"Oakland Athletics","link":"/api/v1/teams/133"},
        "splitSquad":false,"seriesNumber":9
      },
      "home":{
        "leagueRecord":{"wins":17,"losses":9,"pct":".654"},
        "score":6,
        "team":{"id":110,"name":"Baltimore Orioles","link":"/api/v1/teams/110"},
        "splitSquad":false,"seriesNumber":9
      }
    },
    "venue":{"id":2,"name":"Oriole Park at Camden Yards","link":"/api/v1/venues/2"},
    "content":{"link":"/api/v1/game/747045/content"},
    "gameNumber":1,
    "publicFacing":true,
    "doubleHeader":"N",
    "gamedayType":"P",
    "tiebreaker":"N",
    "calendarEventID":"14-747045-2024-04-28",
    "seasonDisplay":"2024",
    "dayNight":"day",
    "scheduledInnings":9,
    "reverseHomeAwayStatus":false,
    "inningBreakLength":120,
    "gamesInSeries":3,
    "seriesGameNumber":3,
    "seriesDescription":"Regular Season",
    "recordSource":"S",
    "ifNecessary":"N",
    "ifNecessaryDescription":"Normal Game"
  }
  """
  
  static var game: String =
    """
    {
      "gamePk":745428,
      "gameGuid":"33799d1a-4692-4e59-aa92-86844235d298",
      "link":"/api/v1.1/game/745428/feed/live",
      "gameType":"R",
      "season":"2024",
      "gameDate":"2024-04-28T20:10:00Z",
      "officialDate":"2024-04-28",
      "status": {
        "abstractGameState":"Preview",
        "codedGameState":"S",
        "detailedState":"Scheduled",
        "statusCode":"S",
        "startTimeTBD":false,
        "abstractGameCode":"P"
      },
      "teams": {
        "away": {
          "leagueRecord": {"wins":18,"losses":10,"pct":".643"},
          "team": {"id":143,"name":"Philadelphia Phillies","link":"/api/v1/teams/143"},
          "splitSquad":false,
          "seriesNumber":9
        },
        "home": {
          "leagueRecord": {"wins":14,"losses":16,"pct":".467"},
          "team": {"id":135,"name":"San Diego Padres","link":"/api/v1/teams/135"},
          "splitSquad":false,
          "seriesNumber":10
        }
      },
      "venue": {
        "id":2680,"name":"Petco Park","link":"/api/v1/venues/2680"
      },
      "content":{
        "link":"/api/v1/game/745428/content"
      },
      "gameNumber":1,
      "publicFacing":true,
      "doubleHeader":"N",
      "gamedayType":"P",
      "tiebreaker":"N",
      "calendarEventID":"14-745428-2024-04-28",
      "seasonDisplay":"2024",
      "dayNight":"day",
      "scheduledInnings":9,
      "reverseHomeAwayStatus":false,
      "inningBreakLength":120,
      "gamesInSeries":3,
      "seriesGameNumber":3,
      "seriesDescription":"Regular Season",
      "recordSource":"S",
      "ifNecessary":"N",
      "ifNecessaryDescription":"Normal Game"
    }
    """

  static var maximumAddress: String =
    """
    https://statsapi.mlb.com/api/v1/schedule?sportId=1&sportId=51&sportId=21&startDate=2024-04-28&endDate=2024-04-28
    &timeZone=America/New_York&gameType=E&&gameType=S&&gameType=R&&gameType=F&&gameType=D&&gameType=L&&gameType=W
    &&gameType=A&&gameType=C&language=en&leagueId=104&&leagueId=103&&leagueId=160&&leagueId=590&hydrate=team,
    linescore(matchup,runners),xrefId,story,flags,statusFlags,broadcasts(all),venue(location),decisions,person,
    probablePitcher,stats,game(content(media(epg),summary),tickets),seriesStatus(useOverride=true)
    &sortBy=gameDate,gameStatus,gameType
    """
  
  static var minimumAddress: String =
    """
    https://statsapi.mlb.com/api/v1/schedule?sportId=1
    &startDate=2024-04-28&endDate=2024-04-28
    &sortBy=gameDate,gameStatus,gameType
    """
  
  static var response: String =
    """
    {"copyright":"Copyright 2024 MLB Advanced Media, L.P.  Use of any content on this page acknowledges agreement to
    the terms posted here http://gdx.mlb.com/components/copyright.txt",
    "totalItems":15,
    "totalEvents":0,
    "totalGames":15,
    "totalGamesInProgress":6,
    "dates":[
      {
        "date":"2024-04-28",
        "totalItems":15,
        "totalEvents":0,
        "totalGames":15,
        "totalGamesInProgress":6,
        "games":[],
        "events":[]
      }
    ]}
    """
}
