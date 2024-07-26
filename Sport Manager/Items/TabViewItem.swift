//
//  TabViewItem.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct TabViewItem: View {
    
    let tabViewImageName: String
    let tabViewText: String
    
    var body: some View {
        VStack(content: {
            Image(tabViewImageName).renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
            Text(tabViewText)
                .font(Font.system(size: 10))
        })
    }
    
}


#Preview {
    TabViewItem(tabViewImageName: "doc.fill", tabViewText: "Note")
}
