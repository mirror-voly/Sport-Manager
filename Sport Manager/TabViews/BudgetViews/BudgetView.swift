//
//  BudgetView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct BudgetView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                
            })
            .navigationTitle("Events")
            .toolbar(content: {
                NavigationLink {
                    Menu("sdfa") {
                        
                    }
                    NewEventView(events: $coordinator.incomes)
                        .navigationTitle("New event")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
        }
        
    }
}

#Preview {
    BudgetView()
}
