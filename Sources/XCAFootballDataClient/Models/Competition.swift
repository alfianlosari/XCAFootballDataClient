//
//  Competition.swift
//
//  Created by Alfian Losari on 23/06/23.
//

import Foundation

public struct Competition: Identifiable, Decodable, Hashable {
    
    public let id: Int
    public let name: String
    public let emblem: String?
    
    init(id: Int, name: String, emblem: String? = nil) {
        self.id = id
        self.name = name
        self.emblem = emblem
    }
    
}

public extension Competition {
    
    static var defaultCompetitions: [Competition] {
        [
            Competition(id: 2014, name: "Spain La Liga"),
            Competition(id: 2021, name: "English Premier League"),
            Competition(id: 2019, name: "Italian Serie A"),
            Competition(id: 2002, name: "Germany Bundesliga"),
            Competition(id: 2003, name: "Netherlands Eredivise"),
            Competition(id: 2015, name: "France Ligue 1"),
            Competition(id: 2013, name: "Brazilian Série A"),
            Competition(id: 2017, name: "Portuguese Primera Liga")
        ]
    }
}
