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
    
    let dataManager = DataManager()
    
    private func removeThis(income: Income) {
        if let index = incomes.firstIndex(of: income) {
            incomes.remove(at: index)
            dataManager.saveIncomes(income: incomes)
        }
    }
    
    var body: some View {
        VStack(content: {
            
        }).onAppear(perform: {
            incomes.append(Income(title: "How Falcons stay on the top after 15 years", date: "02.03.2023", sum: "230"))
            incomes.append(Income(title: "sdsafa sadf sdf asdfa sdfae rwe re wer ", date: "02.03.2023", sum: "230"))
            incomes.append(Income(title: "sdsafa sadf sdf ", date: "02.03.2023", sum: "230"))
            incomes.append(Income(title: "sdsafa te rwe re wer ", date: "02.03.20235555555555555", sum: "230"))
            incomes.append(Income(title: "sdsafa sadrtdrtdrtd tdr t drtdr tdr tdr tdr tdr drtdr tdrt d wer ", date: "02.03.2023", sum: "2305555555"))
        })
        
        if incomes.isEmpty {
            IsEmptyView(currentItem: "incom")
        } else {
            ScrollView(.vertical) {
                LazyVGrid(columns: grid, spacing: 8,  content: {
                    ForEach(incomes, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 8, content: {
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
                                    .frame(maxHeight: .infinity)
                            })
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            Text("+$\(item.sum)")
                                .lineLimit(1)
                                .colorMultiply(.budgetGreen)
                                .font(.system(size: 34))
                                .padding(20)
                            
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
