//
//  ExpensModel.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import Foundation

struct Expense: Codable, Hashable  {
    
    var id = UUID()
    
    let title: String
    let date: String
    let sum: String
}
