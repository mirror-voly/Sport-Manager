//
//  Sport_ManagerApp.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

@main
struct Sport_ManagerApp: App {
    
    @State private var isLoading = false
    @StateObject private var dataManager = DataManager()
        
    private func startLoadingScreen() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack(content: {
                if isLoading {
                    LoadingView()
                } else {
                    RootView()
                }
            })
            .environmentObject(dataManager)
            .preferredColorScheme(.dark)
            .onAppear(perform: {
                startLoadingScreen()
            })
        }
        
    }
}
