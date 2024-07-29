//
//  EventsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct EventsView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State var currentEvent: Event? = nil
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if coordinator.events.isEmpty {
                    VStack(spacing: 10, content: {
                        Text("No events added")
                            .font(.system(size: 28))
                        Text("Add an event with the plus icon above")
                            .font(.system(size: 17))
                    })
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
