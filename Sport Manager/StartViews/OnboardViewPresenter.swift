//
//  OnboardView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

struct OnboardViewPresenter: View {
    
    @Environment(DataManager.self) private var dataManager
    
    @State private var viewTitle = ""
    @State private var viewText = ""
    @State private var currentView = 0
    
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                TabView(selection: $currentView,
                        content:  {
                    OnboardView(viewImageName: "OnboardImageOne").tag(0)
                        .onAppear(perform: {
                            viewTitle = "App for the journalists"
                            viewText = "Add and manage your arcticles"
                        })
                    OnboardView(viewImageName: "OnboardImageTwo").tag(1)
                        .onAppear(perform: {
                            viewTitle = "Manage your budget"
                            viewText = "Add your statistics and earn more"
                        })
                    OnboardView(viewImageName: "OnboardImageThree").tag(2)
                        .onAppear(perform: {
                            viewTitle = "Smart notes"
                            viewText = "Integrated notes to help you in the events"
                        })
                })
                .disabled(true)
                .padding(.top, -geometry.safeAreaInsets.top * 2)
                .tabViewStyle(.page)

                VStack(spacing: 10, content: {
                    Text(viewTitle)
                            .font(.custom("", size: 28))
                        .bold()
                    Text(viewText)
                })
                VStack(content: {
                    Button(action: {
                        if currentView < 2 {
                            currentView += 1
                        } else {
                            dataManager.notAFirstStart = true
                            dataManager.saveSettings()
                        }
                    }, label: {
                        Text("Next")
                            .font(.custom("", size: 17))
                            .tint(.white)
                            .padding(.all, 20)
                            .frame(maxWidth: .infinity)
                    })
                    .background(Color(.buttonColorActive))
                    .clipShape(.rect(cornerRadius: 20))
                    .padding()
                })
            }
        })
            
    }
}


//#Preview {
//    OnboardViewPresenter(notAFirstStart: .constant(true))
//}
