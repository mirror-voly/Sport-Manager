//
//  RootView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI


struct RootView: View {
    
    @EnvironmentObject private var dataManager: DataManager
    @State private var tabViewIndex = 0

    init() {
        UITabBar.appearance().backgroundColor = UIColor(.buttonColorActive.opacity(0.2))
       }
    
    var body: some View {
        ZStack(content: {
            if dataManager.notAFirstStart == true {
                TabView(selection: $tabViewIndex,
                        content: {
                    ArticlesView().tabItem { TabViewItem(tabViewImageName: "doc.fill", tabViewText: "Articles") }
                    EventsView().tabItem { TabViewItem(tabViewImageName: "trophy.fill", tabViewText: " Events") }
                    BudgetView().tabItem { TabViewItem(tabViewImageName: "dollarsign.circle.fill", tabViewText: "Budget") }
                    PostsView().tabItem { TabViewItem(tabViewImageName: "doc.richtext.fill", tabViewText: "Posts") }
                    SettingsView().tabItem { TabViewItem(tabViewImageName: "gearshape.fill", tabViewText: "Settings") }
                })
            } else {
                OnboardViewPresenter(notAFirstStart: $dataManager.notAFirstStart)
            }
        })
        
    }
    
}

#Preview {
    RootView()
}
