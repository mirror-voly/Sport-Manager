//
//  IncomeView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct IncomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        if coordinator.incomes.isEmpty {
            IsEmptyView(currentItem: "incom")
        } else {
                  
        }
        
    }
}

#Preview {
    IncomeView()
}
