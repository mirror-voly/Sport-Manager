//
//  Coordinator.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import Foundation


class Coordinator: ObservableObject {
    
    
    @Published var notAFirstStart: Bool = false
    @Published var articles: [Article] = []
    @Published var events: [Event] = []
    @Published var incomes: [Income] = []
    @Published var expenses: [Expense] = []
}

