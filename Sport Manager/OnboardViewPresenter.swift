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
    
    let onboarsViews: [OnboardView] = []
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor  = UIColor(Color(.onboardColorIndicator))
        UIPageControl.appearance().pageIndicatorTintColor  = UIColor(Color(.onboardColorIndicatorSet))
       }
        
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
                            print(currentView)
                            currentView += 1
                        } else {
                            print("done")
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


struct OnboardView: View, Identifiable {
    
    var id = UUID()
    let viewImageName: String
    
    var body: some View {
        GeometryReader(content: { geometry in
            Image(viewImageName)
                .resizable()
                .frame(width: geometry.size.width, height: 575)
        })
        
        
    }
}


#Preview {
    OnboardViewPresenter()
}
