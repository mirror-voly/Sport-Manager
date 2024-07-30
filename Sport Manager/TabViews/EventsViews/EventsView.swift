//
//  EventsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct EventsView: View {
    
    @EnvironmentObject private var coordinator: DataManager
    @State var currentEvent: Event?
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if coordinator.events.isEmpty {
                    IsEmptyView(currentItem: "event")
                } else {
                    AllEventsView(events: $coordinator.events, currentEvent: $currentEvent)
                }
            })
            .navigationTitle("Events")
            .toolbar(content: {
                NavigationLink {
                    NewEventView(events: $coordinator.events)
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
    EventsView()
}
