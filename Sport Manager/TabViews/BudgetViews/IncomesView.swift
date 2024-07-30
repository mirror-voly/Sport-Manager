//
//  IncomesView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct IncomesView: View {
    
    @Binding var incomes: [Income]
    private let grid = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    private let dataManager = DataManager()
    
    private func removeThis(income: Income) {
        if let index = incomes.firstIndex(of: income) {
            incomes.remove(at: index)
            dataManager.saveIncomes(income: incomes)
        }
    }
    
    var body: some View {

        if incomes.isEmpty {
            IsEmptyView(currentItem: "incom")
        } else {
            ScrollView(.vertical) {
                LazyVGrid(columns: grid, spacing: 8,  content: {
                    ForEach(incomes, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 10, content: {
                            VStack(alignment: .leading, spacing: 8, content: {
                                HStack(content: {
                                    Text(item.date)
                                        .colorMultiply(.mainPlaceholder)
                                        .lineLimit(1)
                                    .font(.system(size: 11))
                                    Spacer()
                                    Button(action: {
                                        removeThis(income: item)
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
                            Text("+$\(item.sum)")
                                .lineLimit(1)
                                .colorMultiply(.budgetGreen)
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

#Preview {
    IncomesView(incomes: .constant([]))
}
