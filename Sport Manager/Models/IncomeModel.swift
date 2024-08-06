//
//  IncomeModel.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import Foundation

struct Income: Codable, Hashable {
    
    let title: String
    let date: String
    let sum: String
    
}

extension Income: Identifiable {
    
    var id: UUID {
        UUID()
    }
    
}
