//
//  Sport_ManagerApp.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

@main
struct Sport_ManagerApp: App {
    @State var isLoading = false
    
    func startLoading() {
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
                        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                }
            }).onAppear(perform: {
                startLoading()
            })
        }
    }
}
