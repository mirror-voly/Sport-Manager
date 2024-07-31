//
//  NewEventView.swift
//  Sport Manager
//
//  Created by mix on 26.07.2024.
//

import SwiftUI

struct NewEventView: View {

    @Binding var events: [Event]
    @State private var correntSportType: Int?
    @State private var allSet = false
    @State private var subtitle = ""
    @State private var teamOneName = ""
    @State private var teamTwoName = ""
    @State private var teamOneScore = ""
    @State private var teamTwoScore = ""
    @State private var date = ""
    private let allSportTypes = Event.SportType.allCases
 
    @EnvironmentObject private var dataManager: DataManager
    @Environment(\.dismiss) var dismis
      
    func isAllFieldsSet() {
        if  !subtitle.isEmpty && !teamOneName.isEmpty && !teamTwoName.isEmpty && !teamOneScore.isEmpty && !teamTwoScore.isEmpty && !date.isEmpty && correntSportType != nil {
            allSet = true
        } else {
            allSet = false
        }
    }
    
    private func addNew() {
        let newEvent = Event(sportType: allSportTypes[correntSportType!], subtitle: subtitle, teamOneName: teamOneName, teamTwoName: teamTwoName, teamOneScore: teamOneScore, teamTwoScore: teamTwoScore, date: date)
        events.append(newEvent)
        dataManager.saveEvents(events: events)
    }
    
    var body: some View {
        ZStack {
            Color(.mainBackground)
                .ignoresSafeArea()
            VStack(spacing: 0, content: {
                HStack(spacing: -20, content: {
                    VStack(content: {
                            TextField("Team 01", text: $teamOneName)
                            .tint(.mainPlaceholder)
                            .onChange(of: teamOneName, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                    
                    
                    VStack(content: {
                            TextField("Team score", text: $teamOneScore)
                            .tint(.mainPlaceholder)
                            .onChange(of: teamOneScore, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                })
                
                HStack(spacing: -20, content: {
                    VStack(content: {
                            TextField("Team 02", text: $teamTwoName)
                            .tint(.mainPlaceholder)
                            .onChange(of: teamTwoName, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                    
                    VStack(content: {
                            TextField("Team score", text: $teamTwoScore)
                            .tint(.mainPlaceholder)
                            .onChange(of: teamTwoScore, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                })
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8, content: {
                        ForEach(Array(zip(allSportTypes.indices, allSportTypes)), id: \.0) { index, item in
                            VStack(alignment: .center, content: {
                                Button {
                                    if correntSportType == index {
                                        correntSportType = nil
                                    } else {
                                        correntSportType = index
                                    }
                                    
                                    isAllFieldsSet()
                                } label: {
                                    ZStack(content: {
                                        if correntSportType != index {
                                            Color.buttonColorActive.opacity(0.5)
                                        } else {
                                            Color.buttonColorActive
                                        }
                                        Text(item.rawValue)
                                            .tint(.white)
                                            .font(.system(size: 11))
                                            .lineLimit(1)
                                            .padding(8)
                                            .fixedSize()
                                    })
                                    .frame(height: 21)
                                }
                            })
                            .clipShape(.rect(cornerRadius: 50))
                        }
                    })
                }
                .padding(.leading)
                
                VStack(content: {
                        TextField("Subtitle", text: $subtitle)
                        .onChange(of: subtitle, { _, _ in
                            isAllFieldsSet()
                        })
                        .padding()
                })
                .frame(height: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.mainPlaceholder, lineWidth: 1)
                        .padding()
                )
                
                VStack(content: {
                    TextField("Date", text: $date, axis: .vertical)
                        .onChange(of: date, { _, _ in
                            isAllFieldsSet()
                        })
                        .padding()
                })
                .frame(minHeight: 62)
                .padding()
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                        .stroke(.mainPlaceholder, lineWidth: 1)
                        .padding()
                )
                Spacer()
                Button(action: {
                    addNew()
                    dismis()
                }, label: {
                            if allSet {
                                Text("Add")
                                    .padding(20)
                                    .frame(maxWidth: .infinity)
                                    .tint(Color.white)
                                    .background(Color.buttonColorActive)
                                    .clipShape(.rect(cornerRadius: 20))
                            } else {
                                Text("Add")
                                    .padding(20)
                                    .frame(maxWidth: .infinity)
                                    .tint(Color.white.opacity(0.5))
                                    .background(Color.buttonColorActive.opacity(0.5))
                                    .clipShape(.rect(cornerRadius: 20))
                            }
                        })
                        .disabled(!allSet)
                        .padding()
            })
            .font(.system(size: 17))
        }
        
    }
}

//#Preview {
//    NewEventView(events: .constant([Event(sportType: .basketball, subtitle: "", teamOneName: "", teamTwoName: "", teamOneScore: "3", teamTwoScore: "3", date: "")]))
//}
