//
//  DataManager.swift
//  Sport Manager
//
//  Created by mix on 25.07.2024.
//

import Foundation

final class DataManager {
    
    func saveSettings(first: Bool) {
        UserDefaults.standard.set(first, forKey: "notAFirstStart")
    }
    
    func loadSettings() -> Bool? {
        let notAFirstStart = UserDefaults.standard.bool(forKey: "notAFirstStart")
        return notAFirstStart
    }
    
    func saveArticles(articles: [Article]) {
        guard let encoded = try? JSONEncoder().encode(articles) else { return }
        UserDefaults.standard.set(encoded, forKey: "articles")
    }
    

    func loadArticles() -> [Article]? {
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
    
    func loadEvents() -> [Event]? {
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
    
    func loadIncomes() -> [Income]? {
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
    
    func loadExpenses() -> [Expense]? {
        if let data = UserDefaults.standard.object(forKey: "expenses") as? Data {
            guard let loadedExpenses = try? JSONDecoder().decode([Expense].self, from: data) else { return nil }
            return loadedExpenses
        }
        return nil
    }
}
