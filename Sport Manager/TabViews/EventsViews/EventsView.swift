//
//  EventsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct EventsView: View {
    
    @Environment(DataManager.self) private var dataManager
    @State private var currentEvent: Event?
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if dataManager.events.isEmpty {
                    IsEmptyView(currentItem: "event")
                } else {
                    AllEventsView(currentEvent: $currentEvent)
                }
            })
            .navigationTitle("Events")
            .toolbar(content: {
                NavigationLink {
                    NewEventView()
                        .navigationTitle("New event")
                        .toolbarRole(.editor)
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            })
        }
        
    }
}

//#Preview {
//    EventsView()
//}
