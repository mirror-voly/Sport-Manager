//
//  EventModel.swift
//  Sport Manager
//
//  Created by mix on 26.07.2024.
//

import Foundation

struct Event: Identifiable, Codable, Equatable {

    var id = UUID()
    
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
    
    let place: String
    let sportType: SportType
    let subtitle: String
    
    let teamOneName: String
    let teamTwoName: String
    let teamOneScore: Int
    let teamTwoScore: Int
    
    let date: String
    
    
}
