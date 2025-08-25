enum Fixtures {
  static var maximumResponse: String = {
  """
  {"copyright":"Copyright 2024 MLB Advanced Media, L.P.  Use of any content on this page acknowledges agreement to the terms posted here http://gdx.mlb.com/components/copyright.txt","totalItems":15,"totalEvents":0,"totalGames":15,"totalGamesInProgress":12,"dates":[{"date":"2024-04-28","totalItems":15,"totalEvents":0,"totalGames":15,"totalGamesInProgress":12,"games":[{"gamePk":747045,"gameGuid":"9406f148-3b20-45c1-9901-d2e5b6054c47","link":"/api/v1.1/game/747045/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T17:35:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":11,"losses":17,"pct":".393"},"score":5,"team":{"id":133,"name":"Athletics","link":"/api/v1/teams/133"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":17,"losses":9,"pct":".654"},"score":6,"team":{"id":110,"name":"Baltimore Orioles","link":"/api/v1/teams/110"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":2,"name":"Oriole Park at Camden Yards","link":"/api/v1/venues/2"},"content":{"link":"/api/v1/game/747045/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-747045-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":747125,"gameGuid":"45a7a5e6-2c7c-482a-8ae0-5e4e8574646e","link":"/api/v1.1/game/747125/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T17:35:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":19,"losses":8,"pct":".704"},"score":3,"team":{"id":114,"name":"Cleveland Guardians","link":"/api/v1/teams/114"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":18,"losses":7,"pct":".720"},"score":3,"team":{"id":144,"name":"Atlanta Braves","link":"/api/v1/teams/144"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":4705,"name":"Truist Park","link":"/api/v1/venues/4705"},"content":{"link":"/api/v1/game/747125/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-747125-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":744947,"gameGuid":"9041be30-be78-4317-a9e0-aad3c74574e5","link":"/api/v1.1/game/744947/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T17:37:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Final","codedGameState":"F","detailedState":"Final","statusCode":"F","startTimeTBD":false,"abstractGameCode":"F"},"teams":{"away":{"leagueRecord":{"wins":18,"losses":12,"pct":".600"},"score":1,"team":{"id":119,"name":"Los Angeles Dodgers","link":"/api/v1/teams/119"},"isWinner":false,"splitSquad":false,"seriesNumber":10},"home":{"leagueRecord":{"wins":14,"losses":15,"pct":".483"},"score":3,"team":{"id":141,"name":"Toronto Blue Jays","link":"/api/v1/teams/141"},"isWinner":true,"splitSquad":false,"seriesNumber":9}},"venue":{"id":14,"name":"Rogers Centre","link":"/api/v1/venues/14"},"content":{"link":"/api/v1/game/744947/content"},"isTie":false,"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-744947-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746483,"gameGuid":"0d9de580-6799-4d2d-9224-d6f10c3b654c","link":"/api/v1.1/game/746483/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T17:40:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Final","codedGameState":"F","detailedState":"Final","statusCode":"F","startTimeTBD":false,"abstractGameCode":"F"},"teams":{"away":{"leagueRecord":{"wins":17,"losses":12,"pct":".586"},"score":1,"team":{"id":118,"name":"Kansas City Royals","link":"/api/v1/teams/118"},"isWinner":false,"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":16,"losses":12,"pct":".571"},"score":4,"team":{"id":116,"name":"Detroit Tigers","link":"/api/v1/teams/116"},"isWinner":true,"splitSquad":false,"seriesNumber":9}},"venue":{"id":2394,"name":"Comerica Park","link":"/api/v1/venues/2394"},"content":{"link":"/api/v1/game/746483/content"},"isTie":false,"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746483-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":745834,"gameGuid":"b2b735b9-df8b-4841-97b7-bf8353274c84","link":"/api/v1.1/game/745834/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T17:40:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":13,"losses":14,"pct":".481"},"score":1,"team":{"id":138,"name":"St. Louis Cardinals","link":"/api/v1/teams/138"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":13,"losses":13,"pct":".500"},"score":1,"team":{"id":121,"name":"New York Mets","link":"/api/v1/teams/121"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":3289,"name":"Citi Field","link":"/api/v1/venues/3289"},"content":{"link":"/api/v1/game/745834/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-745834-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746077,"gameGuid":"42b5f6fd-59ef-4394-a76c-caf8561ff330","link":"/api/v1.1/game/746077/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T17:40:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":12,"losses":14,"pct":".462"},"score":10,"team":{"id":120,"name":"Washington Nationals","link":"/api/v1/teams/120"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":6,"losses":22,"pct":".214"},"score":7,"team":{"id":146,"name":"Miami Marlins","link":"/api/v1/teams/146"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":4169,"name":"loanDepot park","link":"/api/v1/venues/4169"},"content":{"link":"/api/v1/game/746077/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746077-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":4,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746805,"gameGuid":"41509bab-7e3a-449f-a8a0-5c4df7618180","link":"/api/v1.1/game/746805/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T18:10:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":13,"losses":15,"pct":".464"},"score":1,"team":{"id":139,"name":"Tampa Bay Rays","link":"/api/v1/teams/139"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":5,"losses":22,"pct":".185"},"score":4,"team":{"id":145,"name":"Chicago White Sox","link":"/api/v1/teams/145"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":4,"name":"Guaranteed Rate Field","link":"/api/v1/venues/4"},"content":{"link":"/api/v1/game/746805/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746805-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746001,"gameGuid":"498821a3-fe25-4d6d-8856-068a28bff397","link":"/api/v1.1/game/746001/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T18:10:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":18,"losses":10,"pct":".643"},"score":11,"team":{"id":147,"name":"New York Yankees","link":"/api/v1/teams/147"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":17,"losses":9,"pct":".654"},"score":4,"team":{"id":158,"name":"Milwaukee Brewers","link":"/api/v1/teams/158"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":32,"name":"American Family Field","link":"/api/v1/venues/32"},"content":{"link":"/api/v1/game/746001/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746001-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":745022,"gameGuid":"d14e4f71-f487-49c5-aef6-81b216a4cf6c","link":"/api/v1.1/game/745022/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T18:35:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":15,"losses":12,"pct":".556"},"score":3,"team":{"id":113,"name":"Cincinnati Reds","link":"/api/v1/teams/113"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":14,"losses":14,"pct":".500"},"score":4,"team":{"id":140,"name":"Texas Rangers","link":"/api/v1/teams/140"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":5325,"name":"Globe Life Field","link":"/api/v1/venues/5325"},"content":{"link":"/api/v1/game/745022/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-745022-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746561,"gameGuid":"4f2f66d6-2591-44c7-ad83-b8354c07febc","link":"/api/v1.1/game/746561/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T20:05:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":8,"losses":19,"pct":".296"},"score":0,"team":{"id":117,"name":"Houston Astros","link":"/api/v1/teams/117"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":7,"losses":20,"pct":".259"},"score":0,"team":{"id":115,"name":"Colorado Rockies","link":"/api/v1/teams/115"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":5340,"name":"Estadio Alfredo Harp Helu","link":"/api/v1/venues/5340"},"content":{"link":"/api/v1/game/746561/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746561-2024-04-28","seasonDisplay":"2024","dayNight":"day","description":"in Mexico City, MX","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":145,"gamesInSeries":2,"seriesGameNumber":2,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":745349,"gameGuid":"8e9f890a-3ea3-4f56-a23e-d2be63955638","link":"/api/v1.1/game/745349/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T20:05:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":14,"losses":14,"pct":".500"},"score":0,"team":{"id":134,"name":"Pittsburgh Pirates","link":"/api/v1/teams/134"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":13,"losses":15,"pct":".464"},"score":0,"team":{"id":137,"name":"San Francisco Giants","link":"/api/v1/teams/137"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":2395,"name":"Oracle Park","link":"/api/v1/venues/2395"},"content":{"link":"/api/v1/game/745349/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-745349-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746237,"gameGuid":"2f8e8eb2-65ac-43e9-ae94-e571bd3bfdc7","link":"/api/v1.1/game/746237/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T20:07:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"I","detailedState":"In Progress","statusCode":"I","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":13,"losses":13,"pct":".500"},"score":0,"team":{"id":142,"name":"Minnesota Twins","link":"/api/v1/teams/142"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":10,"losses":17,"pct":".370"},"score":0,"team":{"id":108,"name":"Los Angeles Angels","link":"/api/v1/teams/108"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":1,"name":"Angel Stadium","link":"/api/v1/venues/1"},"content":{"link":"/api/v1/game/746237/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746237-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":745265,"gameGuid":"7e8ba658-f5a4-4a07-a4ed-199100b2e0f1","link":"/api/v1.1/game/745265/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T20:10:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"P","detailedState":"Warmup","statusCode":"PW","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":12,"losses":16,"pct":".429"},"score":0,"team":{"id":109,"name":"Arizona Diamondbacks","link":"/api/v1/teams/109"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":15,"losses":12,"pct":".556"},"score":0,"team":{"id":136,"name":"Seattle Mariners","link":"/api/v1/teams/136"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":680,"name":"T-Mobile Park","link":"/api/v1/venues/680"},"content":{"link":"/api/v1/game/745265/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-745265-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":745428,"gameGuid":"33799d1a-4692-4e59-aa92-86844235d298","link":"/api/v1.1/game/745428/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T20:10:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Live","codedGameState":"P","detailedState":"Warmup","statusCode":"PW","startTimeTBD":false,"abstractGameCode":"L"},"teams":{"away":{"leagueRecord":{"wins":18,"losses":10,"pct":".643"},"score":0,"team":{"id":143,"name":"Philadelphia Phillies","link":"/api/v1/teams/143"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":14,"losses":16,"pct":".467"},"score":0,"team":{"id":135,"name":"San Diego Padres","link":"/api/v1/teams/135"},"splitSquad":false,"seriesNumber":10}},"venue":{"id":2680,"name":"Petco Park","link":"/api/v1/venues/2680"},"content":{"link":"/api/v1/game/745428/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-745428-2024-04-28","seasonDisplay":"2024","dayNight":"day","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"},{"gamePk":746967,"gameGuid":"b6751f31-e0d3-4be7-9764-4943cf4369a3","link":"/api/v1.1/game/746967/feed/live","gameType":"R","season":"2024","gameDate":"2024-04-28T23:10:00Z","officialDate":"2024-04-28","status":{"abstractGameState":"Preview","codedGameState":"P","detailedState":"Pre-Game","statusCode":"P","startTimeTBD":false,"abstractGameCode":"P"},"teams":{"away":{"leagueRecord":{"wins":17,"losses":10,"pct":".630"},"score":0,"team":{"id":112,"name":"Chicago Cubs","link":"/api/v1/teams/112"},"splitSquad":false,"seriesNumber":9},"home":{"leagueRecord":{"wins":15,"losses":13,"pct":".536"},"score":0,"team":{"id":111,"name":"Boston Red Sox","link":"/api/v1/teams/111"},"splitSquad":false,"seriesNumber":9}},"venue":{"id":3,"name":"Fenway Park","link":"/api/v1/venues/3"},"content":{"link":"/api/v1/game/746967/content"},"gameNumber":1,"publicFacing":true,"doubleHeader":"N","gamedayType":"P","tiebreaker":"N","calendarEventID":"14-746967-2024-04-28","seasonDisplay":"2024","dayNight":"night","scheduledInnings":9,"reverseHomeAwayStatus":false,"inningBreakLength":120,"gamesInSeries":3,"seriesGameNumber":3,"seriesDescription":"Regular Season","recordSource":"S","ifNecessary":"N","ifNecessaryDescription":"Normal Game"}],"events":[]}]}
  """
  }()
  
  static var gameInProgress: String = {
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
        "team":{"id":133,"name":"Athletics","link":"/api/v1/teams/133"},
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
  }()
  static var game: String = {
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
  }()
  static var maximumAddress: String = {
  """
  https://statsapi.mlb.com/api/v1/schedule?sportId=1&sportId=51&sportId=21&startDate=2024-04-28&endDate=2024-04-28
  &timeZone=America/New_York&gameType=E&&gameType=S&&gameType=R&&gameType=F&&gameType=D&&gameType=L&&gameType=W
  &&gameType=A&&gameType=C&language=en&leagueId=104&&leagueId=103&&leagueId=160&&leagueId=590&hydrate=team,
  linescore(matchup,runners),xrefId,story,flags,statusFlags,broadcasts(all),venue(location),decisions,person,
  probablePitcher,stats,game(content(media(epg),summary),tickets),seriesStatus(useOverride=true)
  &sortBy=gameDate,gameStatus,gameType
  """
  }()
  static var minimumAddress: String = {
  """
  https://statsapi.mlb.com/api/v1/schedule?sportId=1
  &startDate=2024-04-28&endDate=2024-04-28
  &sortBy=gameDate,gameStatus,gameType
  """
  }()
  static var response: String = {
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
  }()
}
