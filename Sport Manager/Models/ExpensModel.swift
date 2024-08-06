//
//  ExpensModel.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import Foundation

struct Expense: Codable, Hashable  {
    
    let title: String
    let date: String
    let sum: String
    
}

extension Expense: Identifiable {
    
    var id: UUID {
        UUID()
    }
    
}
