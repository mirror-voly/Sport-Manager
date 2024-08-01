//
//  AllEventsView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct AllEventsView: View {
    
    @Environment(DataManager.self) private var dataManager
    @Binding var currentEvent: Event?
    
    private func removeCurrentEventElement() {
        if let index = dataManager.events.firstIndex(of: currentEvent!) {
            dataManager.events.remove(at: index)
            dataManager.saveEvents()
        }
    }
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 8, content: {
                
                ForEach(dataManager.events) { event in
                    let teamNames = "\(event.teamOneName) VS \(event.teamTwoName)"
                    HStack(content: {
                        VStack(alignment: .leading, spacing: 4, content: {
                            HStack {
                                VStack {
                                    Text(event.date)
                                        .padding(8)
                                        .font(.system(size: 11))
                                }
                                .background(Color.buttonColorActive)
                                .clipShape(.rect(cornerRadius: 50))
                                
                                Spacer()
                                
                                Text(event.subtitle)
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
}

//#Preview {
//    EventItems(events: <#Binding<[Event]>#>, currentEvent: .constant(nil))
//}
