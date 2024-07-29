//
//  RootView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI


struct RootView: View {
    
    @StateObject private var coordinator = Coordinator()
    @State var tabViewIndex = 0
    private var dataManager = DataManager()
    
    func tryToLoadData() {
        if let articles = dataManager.loadArticles() {
            coordinator.articles = articles
        }
        if let settings = dataManager.loadSettings() {
            coordinator.notAFirstStart = settings
        }
        
        if let events = dataManager.loadEvents() {
            coordinator.events = events
        }
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.buttonColorActive.opacity(0.2))
       }
    
    
    var body: some View {
        ZStack(content: {
            if coordinator.notAFirstStart == true {
                TabView(selection: $tabViewIndex,
                        content: {
                    ArticlesView().tabItem { TabViewItem(tabViewImageName: "doc.fill", tabViewText: "Articles") }
                    EventsView().tabItem { TabViewItem(tabViewImageName: "trophy.fill", tabViewText: " Events") }
                    BudgetView().tabItem { TabViewItem(tabViewImageName: "dollarsign.circle.fill", tabViewText: "Budget") }
                    PostsView().tabItem { TabViewItem(tabViewImageName: "doc.richtext.fill", tabViewText: "Posts") }
                    SettingsView().tabItem { TabViewItem(tabViewImageName: "gearshape.fill", tabViewText: "Settings") }
                })
                .environmentObject(coordinator)
            } else {
                OnboardViewPresenter(notAFirstStart: $coordinator.notAFirstStart)
            }
        }).onAppear(perform: {
            tryToLoadData()
        })
        
    }
    
}

#Preview {
    RootView()
}
