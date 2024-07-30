//
//  OnboardView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

struct OnboardViewPresenter: View {
    
    @State var viewTitle = ""
    @State var viewText = ""
    @State var currentView = 0
    @Binding var notAFirstStart: Bool
    @EnvironmentObject private var dataManager: DataManager
    
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
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                            dataManager.saveSettings(first: true)
                            notAFirstStart = true
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


#Preview {
    OnboardViewPresenter(notAFirstStart: .constant(true))
}
