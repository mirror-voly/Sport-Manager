//
//  DataManager.swift
//  Sport Manager
//
//  Created by mix on 25.07.2024.
//

import Foundation

@Observable
final class DataManager {
    
    init() {
        tryToLoadAll() 
    }
    
    var notAFirstStart: Bool = false
    var articles: [Article] = []
    var events: [Event] = []
    var incomes: [Income] = []
    var expenses: [Expense] = []
    var posts: [Post] = []
    
    func saveSettings() {
        UserDefaults.standard.set(notAFirstStart, forKey: "settings")
    }
    
    private func loadSettings() -> Bool? {
        let notAFirstStart = UserDefaults.standard.bool(forKey: "settings")
        return notAFirstStart
    }
    
    func saveArticles() {
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
    
    func saveEvents() {
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
    
    func saveIncomes() {
        guard let encoded = try? JSONEncoder().encode(incomes) else { return }
        UserDefaults.standard.set(encoded, forKey: "incomes")
    }
    
    private func loadIncomes() -> [Income]? {
        if let data = UserDefaults.standard.object(forKey: "incomes") as? Data {
            guard let loadedIncomes = try? JSONDecoder().decode([Income].self, from: data) else { return nil }
            return loadedIncomes
        }
        return nil
    }
    
    func saveExpenses() {
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
    
    func savePosts() {
        guard let encoded = try? JSONEncoder().encode(posts) else { return }
        UserDefaults.standard.set(encoded, forKey: "posts")
    }
    
    private func loadPosts() -> [Post]? {
        if let data = UserDefaults.standard.object(forKey: "posts") as? Data {
            guard let loadedPosts = try? JSONDecoder().decode([Post].self, from: data) else { return nil }
            return loadedPosts
        }
        return nil
    }
    
    private func tryToLoadAll() {
        articles = loadArticles() ?? []
        events = loadEvents() ?? []
        incomes = loadIncomes() ?? []
        expenses = loadExpenses() ?? []
        posts = loadPosts() ?? []
        notAFirstStart = loadSettings() ?? false
    }
    
    private func saveAll() {
        saveSettings()
        saveArticles()
        saveEvents()
        saveIncomes()
        saveExpenses()
        savePosts()
    }
    
    func resetAll() {
        notAFirstStart = false
        articles = []
        events = []
        incomes = []
        expenses = []
        posts = []
        saveAll()
    }
}
