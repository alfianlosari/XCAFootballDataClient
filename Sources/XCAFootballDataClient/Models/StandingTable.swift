//
//  StandingTable.swift
//
//  Created by Alfian Losari on 23/06/23.
//

import Foundation

public struct Standing: Identifiable, Decodable {
    
    public var id: String {
        "\(type)-\(stage)"
    }
    
    public let type: String
    public let stage: String
    public let table: [TeamStandingTable]
}

public struct TeamStandingTable: Identifiable, Decodable {
    
    public var id: Int { team.id }
    public let position: Int
    public var positionText: String {
        String(position)
    }
    public let team: Team
    
    public var posClubText: String {
        positionText + "  " + (team.shortName ?? team.name)
    }
    
    public let playedGames: Int
    public var playedGamesText: String {
        String(playedGames)
    }
    public let won: Int
    public var wonText: String {
        String(won)
    }
    public let draw: Int
    public var drawText: String {
        String(draw)
    }
    public let lost: Int
    public var lostText: String {
        String(lost)
    }
    public let points: Int
    public var pointsText: String {
        String(points)
    }
    public let goalsFor: Int
    public var goalsForText: String {
        String(goalsFor)
    }
    public let goalsAgainst: Int
    public var goalsAgainstText: String {
        String(goalsAgainst)
    }
    public let goalDifference: Int
    public var goalDifferenceText: String {
        String(goalDifference)
    }
    
    public let form: String?
    public var formArray: [String]? {
        guard let form = form else { return nil}
        return form.components(separatedBy: ",")
    }
    
}

public struct StandingResponse: Decodable {
    
    public var standings: [Standing]?
    
}
