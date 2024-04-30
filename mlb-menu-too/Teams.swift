import AppKit
import Foundation

enum MLBTeam: String, Decodable {
  case dbacks = "Arizona Diamondbacks"
  case braves = "Atlanta Braves"
  case orioles = "Baltimore Orioles"
  case redsox = "Boston Red Sox"
  case cubs = "Chicago Cubs"
  case whitesox = "Chicago White Sox"
  case reds = "Cincinnati Reds"
  case guardians = "Cleveland Guardians"
  case rockies = "Colorado Rockies"
  case tigers = "Detroit Tigers"
  case astros = "Houston Astros"
  case royals = "Kansas City Royals"
  case angels = "Los Angeles Angels"
  case dodgers = "Los Angeles Dodgers"
  case marlins = "Miami Marlins"
  case brewers = "Milwaukee Brewers"
  case twins = "Minnesota Twins"
  case mets = "New York Mets"
  case yankees = "New York Yankees"
  case athletics = "Oakland Athletics"
  case phillies = "Philadelphia Phillies"
  case pirates = "Pittsburgh Pirates"
  case padres = "San Diego Padres"
  case giants = "San Francisco Giants"
  case mariners = "Seattle Mariners"
  case cardinasl = "St. Louis Cardinals"
  case rays = "Tampa Bay Rays"
  case rangers = "Texas Rangers"
  case jays = "Toronto Blue Jays"
  case nationals = "Washington Nationals"
  
  var name: String { rawValue }
  
  var initials: String {
    switch self {
    case .dbacks: return "AZ"
    case .braves: return "ATL"
    case .orioles: return "BAL"
    case .redsox: return "RSX"
    case .cubs: return "CUB"
    case .whitesox: return "WSX"
    case .reds: return "CIN"
    case .guardians: return "CLE"
    case .rockies: return "COL"
    case .tigers: return "DET"
    case .astros: return "HOU"
    case .royals: return "KCR"
    case .angels: return "LAA"
    case .dodgers: return "LAD"
    case .marlins: return "SEA"
    case .brewers: return "MIL"
    case .twins: return "MIN"
    case .mets: return "NYM"
    case .yankees: return "NYY"
    case .athletics: return "OAK"
    case .phillies: return "PHL"
    case .pirates: return "PIR"
    case .padres: return "PAD"
    case .giants: return "SFG"
    case .mariners: return "MIA"
    case .cardinasl: return "STL"
    case .rays: return "TAM"
    case .rangers: return "TEX"
    case .jays: return "TOR"
    case .nationals: return "NAT"
    }
  }
  
  var logo: NSImage {
    NSImage(named: imageName) ?? NSImage()
  }
  
  var imageName: String {
    switch self {
    case .nationals: return "was"
    case .angels: return "ana"
    case .dbacks: return "ari"
    case .braves: return "atl"
    case .orioles: return "bal"
    case .redsox: return "bos"
    case .cubs: return "chc"
    case .reds: return "cin"
    case .guardians: return "cle"
    case .rockies: return "col"
    case .tigers: return "det"
    case .astros: return "hou"
    case .royals: return "kc"
    case .dodgers: return "la"
    case .marlins: return "mia"
    case .brewers: return "mil"
    case .twins: return "min"
    case .mets: return "nym"
    case .yankees: return "nyy"
    case .athletics: return "oak"
    case .phillies: return "phi"
    case .pirates: return "pit"
    case .padres: return "sd"
    case .mariners: return "sea"
    case .giants: return "sf"
    case .cardinasl: return "stl"
    case .rays: return "tb"
    case .rangers: return "tex"
    case .jays: return "tor"
    case .whitesox: return "cws"
    }
  }
}
