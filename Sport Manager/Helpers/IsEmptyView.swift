//
//  IsEmptyView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct IsEmptyView: View {
    
    let currentItem: String
    
    var body: some View {
        VStack(spacing: 10, content: {
            Text("No \(currentItem)s added")
                .font(.system(size: 28))
            Text("Add an \(currentItem) with the plus icon above")
                .font(.system(size: 17))
        })
    }
}

#Preview {
    IsEmptyView(currentItem: "income")
}
