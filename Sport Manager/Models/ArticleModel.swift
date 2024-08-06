//
//  ArticleModel.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import Foundation

struct Article: Identifiable, Codable, Equatable {
    
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
    
    enum Status: CaseIterable, Codable {
        case writing, sent, published, archived
        
        var rawValue: String {
                switch self {
                case .writing: return "Writing"
                case .sent: return "Sent"
                case .published: return "Published"
                case .archived: return "Archived"
                }
            }
    }
    
   
    
    let title: String
    let sportType: SportType
    let text: String
    let publisher: String
    let status: Status
}
