//
//  DataManager.swift
//  Sport Manager
//
//  Created by mix on 25.07.2024.
//

import Foundation

class DataManager {
    
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
    
}
