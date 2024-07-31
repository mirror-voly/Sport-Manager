//
//  SettingsView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct SettingsView: View {

    @State private var resetAletr = false
    @State private var rateAletr = false
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 8, content: {
                    HStack(content: {
                    VStack(alignment: .leading, spacing: 10, content: {
                            Image(systemName: "square.and.arrow.up.fill")
                            .font(.system(size: 34))
                            Text("Share app")
                                .font(.system(size: 15))
                        })
                    .padding(20)
                        Spacer()
                    }).background(Color.cardBackGround)
                        .clipShape(.rect(cornerRadius: 30))
                        .contentShape(Rectangle())
                    
                    HStack(content: {
                    VStack(alignment: .leading, spacing: 10, content: {
                            Image(systemName: "star.fill")
                            .font(.system(size: 34))
                            Text("Rate app")
                                .font(.system(size: 15))
                        })
                    .padding(20)
                        Spacer()
                    })
                    .contentShape(Rectangle())
                    .onTapGesture {
                        resetAletr = false
                        rateAletr = true
                    }
                    .background(Color.cardBackGround)
                        .clipShape(.rect(cornerRadius: 30))
                    
                    HStack(content: {
                    VStack(alignment: .leading, spacing: 10, content: {
                            Image(systemName: "doc.text.fill")
                            .font(.system(size: 34))
                            Text("Usage profile")
                                .font(.system(size: 15))
                        })
                    .padding(20)
                        Spacer()
                    }).background(Color.cardBackGround)
                        .clipShape(.rect(cornerRadius: 30))
                        .contentShape(Rectangle())
                    
                    HStack(content: {
                    VStack(alignment: .leading, spacing: 10, content: {
                            Image(systemName: "arrow.2.circlepath")
                            .font(.system(size: 34))
                            Text("Reset progress")
                                .font(.system(size: 15))
                        })
                    .padding(20)
                        Spacer()
                    })
                    .contentShape(Rectangle())
                    .onTapGesture {
                        resetAletr = true
                        rateAletr = false
                    }
                    .background(Color.settingsRed)
                    .clipShape(.rect(cornerRadius: 30))
                    
                    Spacer()
                })
                .padding()
                if resetAletr {
                    CustomResetAlert(resetAlert: $resetAletr)
                } else if rateAletr {
                    CustomRateAlert(rateAlert: $rateAletr)
                }
            })
            
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingsView()
}
