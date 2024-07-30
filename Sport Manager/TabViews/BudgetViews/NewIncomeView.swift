//
//  NewIncomeView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct NewIncomeView: View {
    
        @Binding var incomes: [Income]
        @State var allSet = false
        @State var title = ""
        @State var date = ""
        @State var sum = ""
     
        private let dataManager = DataManager()
        @Environment(\.dismiss) var dismis
          
        func isAllFieldsSet() {
            if  !title.isEmpty && !date.isEmpty && !sum.isEmpty {
                allSet = true
            } else {
                allSet = false
            }
        }
        
        private func addNew() {
            let newIncome = Income(title: title, date: date, sum: sum)
            incomes.append(newIncome)
            dataManager.saveIncomes(income: incomes)
        }
        
    var body: some View {
        ZStack {
            Color(.mainBackground)
                .ignoresSafeArea()
            VStack(spacing: -20, content: {
                HStack(content: {
                    VStack(content: {
                        TextField("Title", text: $title)
                            .tint(.mainPlaceholder)
                            .onChange(of: title, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                })
                
                HStack(spacing: -20, content: {
                    VStack(content: {
                        TextField("Date", text: $date)
                            .tint(.mainPlaceholder)
                            .onChange(of: date, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                    
                    VStack(content: {
                        TextField("Sum", text: $sum)
                            .tint(.mainPlaceholder)
                            .onChange(of: sum, { _, _ in
                                isAllFieldsSet()
                            })
                            .padding()
                    })
                    .frame(height: 62)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20))
                            .stroke(.mainPlaceholder, lineWidth: 1)
                            .padding()
                    )
                })
                
                Spacer()
                
                Button(action: {
                    addNew()
                    dismis()
                }, label: {
                    if allSet {
                        Text("Add")
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .tint(Color.white)
                            .background(Color.buttonColorActive)
                            .clipShape(.rect(cornerRadius: 20))
                    } else {
                        Text("Add")
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .tint(Color.white.opacity(0.5))
                            .background(Color.buttonColorActive.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 20))
                    }
                })
                .disabled(!allSet)
                .padding()
                .font(.system(size: 17))
            })     
        }
    }
}
//
//#Preview {
//    NewIncomeView()
//}
