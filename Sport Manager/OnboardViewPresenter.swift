//
//  OnboardView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

struct OnboardViewPresenter: View {

    var body: some View {
        VStack {
            TabView {
                OnboardView(viewTitle: "App for the journalists", viewText: "Add and manage your arcticles", viewImageName: "OnboardImageOne")
               OnboardView(viewTitle: "App for the journalists", viewText: "Add and manage your arcticles", viewImageName: "OnboardImageTwo")
               OnboardView(viewTitle: "App for the journalists", viewText: "Add and manage your arcticles", viewImageName: "OnboardImageThree")
           }
           .tabViewStyle(.page(indexDisplayMode: .always))
            
        }
    }
}


struct OnboardView: View {
    
    let viewTitle: String
    let viewText: String
    let viewImageName: String
    
    var body: some View {
        TabView {
            VStack {
                GeometryReader(content: { geometry in
                    Image(viewImageName)
                })
                
                    
//                Text(viewTitle)
//                    .font(.custom("", size: 28))
//                    .bold()
//                Text(viewText)
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
