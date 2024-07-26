//
//  RootView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI


struct RootView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.buttonColorActive.opacity(0.2))
       }
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        
        if coordinator.notAFirstStart == true {
            TabView(selection: .constant(0),
                    content: {
                ArticlesView().tabItem { TabViewItem(tabViewImageName: "doc.fill", tabViewText: "Articles") }
                EventsView().tabItem { TabViewItem(tabViewImageName: "trophy.fill", tabViewText: " Events") }
                BudgetView().tabItem { TabViewItem(tabViewImageName: "dollarsign.circle.fill", tabViewText: "Budget") }
                PostsView().tabItem { TabViewItem(tabViewImageName: "doc.richtext.fill", tabViewText: "Posts") }
                SettingsView().tabItem { TabViewItem(tabViewImageName: "gearshape.fill", tabViewText: "Settings") }
            })
        } else {
            OnboardViewPresenter(notAFirstStart: $coordinator.notAFirstStart)
        }
    }
    
}

#Preview {
    RootView()
}
