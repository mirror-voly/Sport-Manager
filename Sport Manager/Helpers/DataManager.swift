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
    
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()
    
    private(set) var notAFirstStart: Bool = false
    private(set) var articles: [Article] = []
    private(set) var events: [Event] = []
    private(set) var incomes: [Income] = []
    private(set) var expenses: [Expense] = []
    private(set) var posts: [Post] = []
    
    private func saveSettings() {
        UserDefaults.standard.set(notAFirstStart, forKey: "settings")
    }

    private func save<T: Encodable>(items: [T], forKey key: String) {
        guard let encoded = try? jsonEncoder.encode(items) else { return }
        UserDefaults.standard.set(encoded, forKey: key)
    }

    private func saveAll() {
        save(items: articles, forKey: "articles")
        save(items: events, forKey: "events")
        save(items: incomes, forKey: "incomes")
        save(items: expenses, forKey: "expenses")
        save(items: posts, forKey: "posts")
        saveSettings()
    }
    
    private func remove<T: Equatable>(item: T, from array: inout [T]) {
        if let index = array.firstIndex(of: item) {
            array.remove(at: index)
        }
    }
    
    func removeItem<T>(_ item: T) {
        switch item {
        case let event as Event:
            remove(item: event, from: &events)
        case let income as Income:
            remove(item: income, from: &incomes)
        case let expense as Expense:
            remove(item: expense, from: &expenses)
        default:
            break
        }
        saveAll()
    }
    
    private func add<T: Equatable>(item: T, from array: inout [T]) {
        array.append(item)
    }
    
    func appendItem<T>(_ item: T) {
        switch item {
        case let article as Article:
            add(item: article, from: &articles)
        case let event as Event:
            add(item: event, from: &events)
        case let income as Income:
            add(item: income, from: &incomes)
        case let expense as Expense:
            add(item: expense, from: &expenses)
        case let post as Post:
            add(item: post, from: &posts)
        default:
            break
        }
        saveAll()
    }
    
    private func loadSettings() -> Bool {
        return UserDefaults.standard.bool(forKey: "settings")
    }

    private func load<T: Decodable>(forKey key: String) -> [T]? {
        if let data = UserDefaults.standard.data(forKey: key) {
            return try? jsonDecoder.decode([T].self, from: data)
        }
        return nil
    }

    private func tryToLoadAll() {
        articles = load(forKey: "articles") ?? []
        events = load(forKey: "events") ?? []
        incomes = load(forKey: "incomes") ?? []
        expenses = load(forKey: "expenses") ?? []
        posts = load(forKey: "posts") ?? []
        notAFirstStart = loadSettings()
    }
    
    func tugglenotAFirstStart() {
        notAFirstStart = true
        saveAll()
    }
    
    func resetAll() {
        notAFirstStart = false
        articles.removeAll()
        events.removeAll()
        incomes.removeAll()
        expenses.removeAll()
        posts.removeAll()
        saveAll()
    }
}
