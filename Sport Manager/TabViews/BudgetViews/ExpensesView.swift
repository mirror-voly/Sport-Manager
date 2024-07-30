//
//  ExpensesView.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct ExpensesView: View {
    
    @Binding var expenses: [Expense]
    
    var body: some View {
        if expenses.isEmpty {
            IsEmptyView(currentItem: "expense")
        } else {
                  
        }
        
    }
}

#Preview {
    ExpensesView(expenses: .constant([]))
}
