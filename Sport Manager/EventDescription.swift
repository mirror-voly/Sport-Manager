//
//  EventDescription.swift
//  Sport Manager
//
//  Created by mix on 26.07.2024.
//

import SwiftUI

struct EventDescription: View {
    
    var event: Event
    
    var body: some View {
        ZStack(content: {
            Color.mainBackground
                .ignoresSafeArea()
            VStack(alignment: .leading, content: {
                    HStack(content: {
                        Text(event.place)
                            .colorMultiply(Color(UIColor.placeholderText))
                            .font(.system(size: 15))
                        Spacer()
                        VStack {
                            Text(event.date)
                                .padding(8)
                                .font(.system(size: 11))
                        }
                        .background(Color.buttonColorActive)
                        .clipShape(.rect(cornerRadius: 50))
                    })
                HStack(alignment: .top, content: {
                    Spacer()
                    VStack(content: {
                        Text(event.teamOneScore.formatted())
                            .font(.system(size: 68))
                        Text(event.teamOneName)
                            .font(.system(size: 17))
                    })
                    Text(":")
                        .font(.system(size: 68))
                        .padding(.horizontal)
                        .padding(.top, -5)
                    VStack(content: {
                        Text(event.teamTwoScore.formatted())
                            .font(.system(size: 68))
                        Text(event.teamTwoName)
                            .font(.system(size: 17))
                    })
                    Spacer()
                })
                
                Text(event.subtitle)
                    .font(.system(size: 17))
                    .padding(.top)
                Spacer()
            })
            .padding()
        })
        
        
    }
}


#Preview {
    EventDescription(event: Event(place: "Toronto", sportType: .box, subtitle: "lol what?", teamOneName: "Aven", teamTwoName: "Wola", teamOneScore: 5, teamTwoScore: 3, date: "02.03.2024"))
}
