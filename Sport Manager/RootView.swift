//
//  RootView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI


struct RootView: View {
    
    @State var firstStart = true
    
    var body: some View {
        if firstStart == false {
            TabView(selection: .constant(0),
                    content: {
                AtriclesView().tabItem { TabViewItem(tabViewImageName: "doc.fill", tabViewText: "Articles") }
                EventsView().tabItem { TabViewItem(tabViewImageName: "trophy.fill", tabViewText: " Events") }
                BudgetView().tabItem { TabViewItem(tabViewImageName: "dollarsign.circle.fill", tabViewText: "Budget") }
                PostsView().tabItem { TabViewItem(tabViewImageName: "doc.richtext.fill", tabViewText: "Posts") }
                SettingsView().tabItem { TabViewItem(tabViewImageName: "gearshape.fill", tabViewText: "Settings") }
            })
        } else {
            OnboardViewPresenter(firstStart: $firstStart)
        }
//
    }
}

#Preview {
    RootView()
}
