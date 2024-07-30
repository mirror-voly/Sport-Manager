//
//  PostModel.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    
    var id = UUID()
    
    let title: String
    let text: String
    let date: Date
}

