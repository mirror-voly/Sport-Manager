//
//  EventsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct EventsView: View {
    
//    @EnvironmentObject private var coordinator: Coordinator
    @State var events: [Event] = []
    @State var currentEvent: Event? = nil
    
    func removeCurrentEventElement() {
        if let index = events.firstIndex(of: currentEvent!) {
            events.remove(at: index)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                if events.count == 0 {
                    VStack(spacing: 10, content: {
                        Text("No events added")
                            .font(.system(size: 28))
                        Text("Add an event with the plus icon above")
                            .font(.system(size: 17))
                    })
                } else {
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 8, content: {
                            ForEach($events) { event in
                                let teamNames = "\(event.teamOneName) VS \(event.teamTwoName)"
                                HStack(content: {
                                    VStack(alignment: .leading, spacing: 4, content: {
                                        HStack {
                                            VStack {
                                                Text(event.date.count)
                                                    .padding(8)
                                                    .font(.system(size: 11))
                                            }
                                            .background(Color.buttonColorActive)
                                            .clipShape(.rect(cornerRadius: 50))
                                            
                                            Spacer()
                                            Text(event.place)
                                                .colorMultiply(Color(UIColor.placeholderText))
                                        }
                                        
                                        Text(teamNames)
                                            .font(.system(size: 22))
                                            .lineLimit(1)
                                            .padding(.top, 6)
                                    })
                                    Spacer()
                                })
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    currentEvent = event
                                }
                                .sheet(item: $currentEvent) { event in
                                    NavigationView {
                                        EventDescription(event: event)
                                            .navigationTitle(teamNames)
                                            .navigationBarBackButtonHidden()
                                            .tint(Color.white)
                                            .toolbar(content: {
                                                ToolbarItem(placement: .topBarLeading) {
                                                    Button {
                                                        currentEvent = nil
                                                    }
                                                label: {
                                                    Image(systemName: "chevron.backward")
                                                        .fontWeight(.semibold)
                                                }
                                                }
                                                ToolbarItem(placement: .topBarTrailing) {
                                                    Button {
                                                        removeCurrentEventElement()
                                                        currentEvent = nil
                                                    }
                                                label: {
                                                    Image(systemName: "trash")
                                                        .fontWeight(.semibold)
                                                }
                                                }
                                            })
                                    }
                                    .tint(Color.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(Color.buttonColorActive.opacity(0.15))
                                .clipShape(.rect(cornerRadius: 30))
                            }
                        })
                        .padding()
                    }
                }
            })
            .navigationTitle("Events")
            .toolbar(content: {
                NavigationLink {
                    NewEvent(events: $events)
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
