//
//  CustomRateAlert.swift
//  Sport Manager
//
//  Created by mix on 31.07.2024.
//

import SwiftUI

struct CustomRateAlert: View {
    
    @Binding var rateAlert: Bool
    @EnvironmentObject private var dataManager: DataManager
    
    var starsCount = 5
    var currentRate: Int?
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0, content: {
            VStack(content: {
                Rectangle()
                    .frame(width: 60, height: 60)
                    .clipShape(.rect(cornerRadius: 14))
                    .padding()
                Text("Review app?")
                    .font(.system(size: 17))
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                Text("Tap a star to rate it on the App Store")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
            })
            .padding(.horizontal)
            .padding(.top)
                Divider()
            HStack(alignment: .center, spacing: 20, content: {
                ForEach(0..<5) { item in
                    Button {
                        rateAlert = false
                    } label: {
                        Image(systemName: "star")
                            .renderingMode(.template)
                            .tint(.blue)
                            .frame(width: 20, height: 20)
                    }
                    .tint(.white)
                }
            }).padding()
                
                Divider()
                
                Button {
                    rateAlert = false
                } label: {
                    Text("Not now")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.system(size: 17))
                        .frame(height: 44)
                }
                .tint(.settingsRed)
            
        })
        .background(.settingrsAlertBackground)
        .frame(width: 270)
        .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    CustomRateAlert(rateAlert: .constant(true))
}
