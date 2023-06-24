//
//  Scorer.swift
//
//  Created by Alfian Losari on 24/06/23.
//

import Foundation

public struct Scorer: Identifiable, Decodable {
    
    public var id: Int { player.id }
    public var pos: Int?
    public var posText: String {
        guard let pos = pos else {
            return "-"
        }
        return String(pos)
    }
    
    public var player: Player
    public var team: Team
    public var playedMatches: Int?
    public var playedMatchesText: String {
        guard let playedMatches = playedMatches else {
            return "-"
        }
        return String(playedMatches)
    }
    
    public var goals: Int?
    public var goalsText: String {
        guard let goals = goals else {
            return "-"
        }
        return String(goals)
    }
    
    public var assists: Int?
    public var assistsText: String {
        guard let assists = assists else {
            return "-"
        }
        return String(assists)
    }
    
    public var penalties: Int?
    public var penaltiesText: String {
        guard let penalties = penalties else {
            return "-"
        }
        return String(penalties)
    }
    
    public var goalsPerMatchRatioText: String {
        guard let goals = goals, let playedMatches = playedMatches else {
            return "-"
        }
        return String(format: "%.2f", Double(goals) / Double(playedMatches))
    }
    
}

public struct TopScorersResponse: Decodable {
    
    public var scorers: [Scorer]?
    
}
