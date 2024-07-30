//
//  IncomesView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct IncomesView: View {
    
    @Binding var incomes: [Income]
    
    var body: some View {
        if incomes.isEmpty {
            IsEmptyView(currentItem: "incom")
        } else {
                  
        }
        
    }
}

#Preview {
    IncomesView(incomes: .constant([]))
}
