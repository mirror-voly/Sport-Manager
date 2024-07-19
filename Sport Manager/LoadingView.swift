//
//  LoadingView.swift
//  Sport Manager
//
//  Created by mix on 19.07.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .frame(width: 150, height: 150)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.loadinViewBackground)

    }
}

#Preview {
    LoadingView()
}
