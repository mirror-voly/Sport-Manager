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
                VStack(alignment: .leading,content: {
                    HStack(content: {
//                        Text(event.status.rawValue)
//                            .font(.system(size: 17))
                        Spacer()
                        VStack {
                            Text(event.sportType.rawValue)
                                .padding(8)
                                .font(.system(size: 11))
                        }
                        .background(Color.buttonColorActive)
                        .clipShape(.rect(cornerRadius: 50))
                    })
                    Text(event.teamOneName)
                    
                        .colorMultiply(Color(UIColor.placeholderText))
                        .font(.system(size: 17))
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
    EventDescription(event: Event(place: "Toronto", sportType: .box, subtitle: "lol what?", teamOneName: "aven", teamTwoName: "wola", teamOneScore: 5, teamTwoScore: 3, date: "02.03.2024event"))
}
