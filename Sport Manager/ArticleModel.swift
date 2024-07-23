//
//  ArticleModel.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import Foundation

struct Article {
    
    enum SportType {
        case basketball, football, volleyball, hockey, box, golf, other
    }
    
    enum Status: CaseIterable {
        case sent, published, archived
    }
    
    let title: String
    let sportType: SportType
    let text: String
    let publisher: String
    let when: Date
    let status: Status
}
