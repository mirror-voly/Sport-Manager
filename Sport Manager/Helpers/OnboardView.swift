//
//  OnboardView.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

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
