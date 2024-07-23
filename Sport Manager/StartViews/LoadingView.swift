//
//  LoadingView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @State var startAnimation = false
    
    var body: some View {
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .frame(width: 150, height: 150)
                .padding(.bottom, 250)
            ZStack (alignment: .topLeading, content: {
                Rectangle().frame(width: 190, height: 6)
                    .padding(.bottom, 100)
                    .colorMultiply(Color(UIColor(white: 1, alpha: 0.1)))
                Rectangle().frame(width: startAnimation ? 190 : 10, height: 6)
                    .padding(.bottom, 100)
                    .colorMultiply(Color.buttonColorActive)
            }).animation(.smooth(duration: 3),  value: startAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .onAppear(perform: {
            startAnimation = true
        })

    }
}

#Preview {
    LoadingView()
}
