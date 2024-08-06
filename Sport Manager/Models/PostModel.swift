//
//  PostModel.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import Foundation

struct Post: Codable, Hashable {
    
    let title: String
    let text: String
    let date: Date
    
}

extension Post: Identifiable {
    
    var id: UUID {
        UUID()
    }
    
}

