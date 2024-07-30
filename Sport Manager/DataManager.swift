//
//  DataManager.swift
//  Sport Manager
//
//  Created by mix on 25.07.2024.
//

import Foundation

final class DataManager: ObservableObject {
    
    init() {
        tryToLoadData() 
    }
    
    @Published var notAFirstStart: Bool = false
    @Published var articles: [Article] = []
    @Published var events: [Event] = []
    @Published var incomes: [Income] = []
    @Published var expenses: [Expense] = []
    
    func saveSettings(first: Bool) {
        UserDefaults.standard.set(first, forKey: "notAFirstStart")
    }
    
    private func loadSettings() -> Bool? {
        let notAFirstStart = UserDefaults.standard.bool(forKey: "notAFirstStart")
        return notAFirstStart
    }
    
    func saveArticles(articles: [Article]) {
        guard let encoded = try? JSONEncoder().encode(articles) else { return }
        UserDefaults.standard.set(encoded, forKey: "articles")
    }
    

    private func loadArticles() -> [Article]? {
        if let data = UserDefaults.standard.object(forKey: "articles") as? Data {
            guard let loadedArticles = try? JSONDecoder().decode([Article].self, from: data) else { return nil }
            return loadedArticles
        }
        return nil
    }
    
    func saveEvents(events: [Event]) {
        guard let encoded = try? JSONEncoder().encode(events) else { return }
        UserDefaults.standard.set(encoded, forKey: "events")
    }
    
    private func loadEvents() -> [Event]? {
        if let data = UserDefaults.standard.object(forKey: "events") as? Data {
            guard let loadedEvents = try? JSONDecoder().decode([Event].self, from: data) else { return nil }
            return loadedEvents
        }
        return nil
    }
    
    func saveIncomes(income: [Income]) {
        guard let encoded = try? JSONEncoder().encode(income) else { return }
        UserDefaults.standard.set(encoded, forKey: "incomes")
    }
    
    private func loadIncomes() -> [Income]? {
        if let data = UserDefaults.standard.object(forKey: "incomes") as? Data {
            guard let loadedIncomes = try? JSONDecoder().decode([Income].self, from: data) else { return nil }
            return loadedIncomes
        }
        return nil
    }
    
    func saveExpenses(expenses: [Expense]) {
        guard let encoded = try? JSONEncoder().encode(expenses) else { return }
        UserDefaults.standard.set(encoded, forKey: "expenses")
    }
    
    private func loadExpenses() -> [Expense]? {
        if let data = UserDefaults.standard.object(forKey: "expenses") as? Data {
            guard let loadedExpenses = try? JSONDecoder().decode([Expense].self, from: data) else { return nil }
            return loadedExpenses
        }
        return nil
    }
    
    private func tryToLoadData() {
        if let loadedArticles = loadArticles() {
            articles = loadedArticles
        }
        if let loadedsettings = loadSettings() {
            notAFirstStart = loadedsettings
        }
        
        if let loadedEvents = loadEvents() {
            events = loadedEvents
        }
        
        if let loadedIncomes = loadIncomes() {
            incomes = loadedIncomes
        }
        
        if let loadedExpenses = loadExpenses() {
            expenses = loadedExpenses
        }
    }
}
