//
//  ExpensesView.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct ExpensesView: View {
    
    
    @EnvironmentObject private var dataManager: DataManager
    
    @Binding var expenses: [Expense]
    private let grid = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    private func removeThis(expense: Expense) {
        if let index = expenses.firstIndex(of: expense) {
            expenses.remove(at: index)
            dataManager.saveExpenses(expenses: expenses)
        }
    }

    var body: some View {      
        
        if expenses.isEmpty {
            IsEmptyView(currentItem: "expense")
        } else {
            ScrollView(.vertical) {
                LazyVGrid(columns: grid, spacing: 8,  content: {
                    ForEach(expenses, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 10, content: {
                            VStack(alignment: .leading, spacing: 8, content: {
                                HStack(content: {
                                    Text(item.date)
                                        .colorMultiply(.mainPlaceholder)
                                        .lineLimit(1)
                                        .font(.system(size: 11))
                                    Spacer()
                                    Button(action: {
                                        removeThis(expense: item)
                                    }, label: {
                                        Image(systemName: "trash")
                                            .tint(.mainPlaceholder)
                                            .fontWeight(.semibold)
                                    })
                                })
                                Text(item.title)
                                    .font(.system(size: 16))
                                    .lineLimit(nil)
                                    
                                Spacer()
                            })
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            Text("-$\(item.sum)")
                                .lineLimit(1)
                                .colorMultiply(.budgetRed)
                                .font(.system(size: 34))
                                .padding(.horizontal)
                                .padding(.bottom)
                        })
                        .background(Color.cardBackGround)
                        .clipShape(.rect(cornerRadius: 30))
                        .frame(width: 170)
                    }
                })
            }
        }
        
    }
}

//#Preview {
//    ExpensesView(expenses: .constant([]))
//}
