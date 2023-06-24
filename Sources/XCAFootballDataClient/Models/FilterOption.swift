//
//  FilterOption.swift
//
//  Created by Alfian Losari on 24/06/23.
//

import Foundation

public enum FilterOption: Identifiable, Hashable {
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd"
        return df
    }()
    
    public var id: String {
        switch self {
        case .latest:
            return "latest"
        case .year(let int):
            return String(int)
        }
    }
    
    case latest
    case year(Int)
    
    public var text: String {
        switch self {
        case .latest:
            return "Latest"
        case .year(let int):
            return "\(int)/\(int + 1)"
        }
    }
    
    public var urlQuery: String {
        switch self {
        case .latest:
            return "date=\(Self.dateFormatter.string(from: .now))"
        case .year(let int):
            return "season=\(String(int))"
        }
    }
}
