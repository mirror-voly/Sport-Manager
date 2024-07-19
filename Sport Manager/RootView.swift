//
//  RootView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack(content: {
                OnboardViewPresenter()
                .padding(.top, -110)

                Button(action: {
                    print("NEXT")
                }, label: {
                    Text("Next")
                        .font(.custom("", size: 17))
                        .tint(.white)
                        .padding(.all, 20)
                })
                .frame(maxWidth: .infinity)
                .background(Color(.blue))
                .clipShape(.rect(cornerRadius: 20))
                .padding()
        })
    }
}

#Preview {
    RootView()
}
