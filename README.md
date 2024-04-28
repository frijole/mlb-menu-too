# mlb-menu-too

I ran across the old [MLB Menu](https://github.com/markolson/MLB-Menu) and wanted to try and make a modern version.

There is a newer API endpoint for data: `https://statsapi.mlb.com/api/v1/schedule`

The endpoint requires at least a `sportID` or `gamePk` parameter to provide more data.

A sample request URL from the scoreboard website:
```
  https://statsapi.mlb.com/api/v1/schedule?sportId=1&sportId=51&sportId=21&startDate=2024-04-28&endDate=2024-04-28
  &timeZone=America/New_York&gameType=E&&gameType=S&&gameType=R&&gameType=F&&gameType=D&&gameType=L&&gameType=W
  &&gameType=A&&gameType=C&language=en&leagueId=104&&leagueId=103&&leagueId=160&&leagueId=590&hydrate=team,
  linescore(matchup,runners),xrefId,story,flags,statusFlags,broadcasts(all),venue(location),decisions,person,
  probablePitcher,stats,game(content(media(epg),summary),tickets),seriesStatus(useOverride=true)
  &sortBy=gameDate,gameStatus,gameType
```

* what do `sportId` values other than `1` mean?
* what are the `gameType`: `E` `S` `R` `F` `D` `L` `W` `A` `C`
* there are four `leagueId`: `104` `103` `160` `590`
* `hydrate` seems useful, the options from the web request:
 - `team`
 - `linescore(matchup,runners)` additional params in `()`?
 - `xrefId`
 - `story`
 - `flags`
 - `broadcasts(all)`
 - `venue(location)`
 - `decisions`
 - `person`
 - `probablePitcher`
 - `stats`
 - `game(content(media(epg),summary),tickets)`
 - `seriesStatus(useOverride=true)`
* `sortBy` takes at least
 - `gameDate`
 - `gameStatus`
 - `gameType`

A sample game:
```
{
  "gamePk":745428,
  "gameGuid":"33799d1a-4692-4e59-aa92-86844235d298",
  "link":"/api/v1.1/game/745428/feed/live",
  "gameType":"R",
  "season":"2024",
  "gameDate":"2024-04-28T20:10:00Z",
  "officialDate":"2024-04-28",
  "status":{
    "abstractGameState":"Preview",
    "codedGameState":"S",
    "detailedState":
    "Scheduled","statusCode":"S",
    "startTimeTBD":false,
    "abstractGameCode":"P"
  },
  "teams":{
    "away":{
      "leagueRecord":{"wins":18,"losses":10,"pct":".643"},
      "team":{
        "id":143,
        "name":"Philadelphia Phillies",
        "link":"/api/v1/teams/143"
      },
      "splitSquad":false,
      "seriesNumber":9
    },
    "home":{
      "leagueRecord":{"wins":14,"losses":16,"pct":".467"},
      "team":{
        "id":135,
        "name":"San Diego Padres",
        "link":"/api/v1/teams/135"
      },
      "splitSquad":false,
      "seriesNumber":10
    }
  },
  "venue":{"id":2680,"name":"Petco Park","link":"/api/v1/venues/2680"},
  "content":{"link":"/api/v1/game/745428/content"},
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
```


## TODO
* ???


## DONE?
* nothing!
