//
//  RootView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI


struct RootView: View {
    
    
    var body: some View {
        Spacer()
        TabView(selection: .constant(0),
                content: {
            AtriclesView().tabItem { Label("lol", image: .onboardImageTwo) }
            
        })
//                OnboardViewPresenter()
    }
}

#Preview {
    RootView()
}
