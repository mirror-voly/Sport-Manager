//
//  EventModel.swift
//  Sport Manager
//
//  Created by mix on 26.07.2024.
//

import Foundation

struct Event: Codable, Equatable {
    
    enum SportType: CaseIterable, Codable {
        case basketball, football, volleyball, hockey, box, golf, other
        
        var rawValue: String {
                switch self {
                case .basketball: return "Basketball"
                case .football: return "Football"
                case .volleyball: return "Volleyball"
                case .hockey: return "Hockey"
                case .box: return "Box"
                case .golf: return "Golf"
                case .other: return "Other"
                }
            }
    }
    
    let sportType: SportType
    let subtitle: String
    let teamOneName: String
    let teamTwoName: String
    let teamOneScore: String
    let teamTwoScore: String
    let date: String
        
}

extension Event: Identifiable {
    
    var id: UUID {
        UUID()
    }
    
}
