//
//  Sport_ManagerApp.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

@main
struct Sport_ManagerApp: App {
    
    @StateObject private var coordinator = Coordinator()
    private var dataManager = DataManager()
    
    func tryToLoadData() {
        if let data = dataManager.loadArticles() {
            coordinator.articles = data
        }
        if let settings = dataManager.loadSettings() {
            coordinator.notAFirstStart = settings
        }    
    }
    
    func startLoadingScreen() {
        coordinator.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            coordinator.isLoading = false
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack(content: {
                if coordinator.isLoading {
                    LoadingView()
                } else {
                    RootView()
                }
            })
            .preferredColorScheme(.dark)
            .environmentObject(coordinator)
            .onAppear(perform: {
                startLoadingScreen()
                tryToLoadData()
            })
        }
        
    }
}
