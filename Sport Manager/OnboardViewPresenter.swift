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
    
    
    let onboarsViews: [OnboardView] = [OnboardView(viewTitle: "App for the journalists", viewText:                                      "Add and manage your arcticles", viewImageName:
                                        "OnboardImageOne"),
                                       OnboardView(viewTitle: "Manage your budget", viewText: "Add your statistics and earn more", viewImageName: "OnboardImageTwo"),
                                        OnboardView(viewTitle: "Smart notes", viewText: "Integrated notes to help you in the events", viewImageName: "OnboardImageThree")]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(onboarsViews) { view in
                    view
                        .onAppear(perform: {
                            viewTitle = view.viewTitle
                            viewText = view.viewText
                        })
                    
                }
           }
           .tabViewStyle(.page)
            Spacer()
            
            VStack(spacing: 10, content: {
                Text(viewTitle)
                        .font(.custom("", size: 28))
                    .bold()
                Text(viewText)
            })
            .padding()
              
        }
    }
}


struct OnboardView: View, Identifiable {
    
    var id = UUID()
    let viewTitle: String
    let viewText: String
    let viewImageName: String
    
    var body: some View {
        TabView {
            VStack {
                GeometryReader(content: { geometry in
                    Image(viewImageName)
                })
                

            }
        }
    }
}

#Preview {
    OnboardView(viewTitle: "App for the journalists", viewText: "Add and manage your arcticles", viewImageName: "OnboardImageOne")
}

#Preview {
    OnboardViewPresenter()
}
