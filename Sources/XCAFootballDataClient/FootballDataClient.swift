//
//  FootballDataClient.swift
//
//  Created by Alfian Losari on 23/06/23.
//

import Foundation

public struct FootballDataClient {
    
    private let urlSession = URLSession.shared
    private let apiKey: String
    private let baseURL = "https://api.football-data.org/v4"
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func fetchStandings(competitionId: Int, filterOption: FilterOption = .latest) async throws -> [TeamStandingTable] {
        let url = baseURL + "/competitions/\(competitionId)/standings?\(filterOption.urlQuery)"
        let urlRequest = URLRequest(url: URL(string: url)!)
        let response: StandingResponse = try await fetchData(request: urlRequest)
        guard let standingTable = response.standings?.first?.table else {
            throw "Top Scorers not found"
        }
        return standingTable
    }
    
    public func fetchTopScorers(competitionId: Int, filterOption: FilterOption = .latest) async throws -> [Scorer] {
        let url = baseURL + "/competitions/\(competitionId)/scorers?\(filterOption.urlQuery)"
        let urlRequest = URLRequest(url: URL(string: url)!)
        let response: TopScorersResponse = try await fetchData(request: urlRequest)
        guard let scorers = response.scorers else {
            throw "Standings not found"
        }
        return scorers
    }
    
    private func fetchData<D: Decodable>(request: URLRequest) async throws -> D {
        var urlRequest = request
        urlRequest.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw "Data not found. Code \((response as? HTTPURLResponse)?.statusCode ?? -1)"
        }
        
        let model = try self.jsonDecoder.decode(D.self, from: data)
        return model
    }
    
    
    private func startEndDateFilter(isUpcoming: Bool) -> (String, String) {
        let today = Date()
        let tenDays = today.addingTimeInterval(86400 * (isUpcoming ? 10 : -10))
        
        let todayText = dateFormatter.string(from: today)
        let tenDaysText = dateFormatter.string(from: tenDays)
        return isUpcoming ? (todayText, tenDaysText) : (tenDaysText, todayText)
    }
    
}


extension String: Error, LocalizedError {
    
    public var errorDescription: String? { self }
    
}

