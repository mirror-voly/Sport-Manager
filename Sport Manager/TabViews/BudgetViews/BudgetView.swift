//
//  BudgetView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct BudgetView: View {
    
    @Environment(DataManager.self) private var dataManager
    
    @State private var sheetIsOpened = false
    @State private var navigationAddButtonePopUP = false
    @State private var newPurcheaseState: NewPurchase.PurchaseState?
    @State private var currentSegment: NewPurchase.PurchaseState = .income
    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
                VStack {
                    CustomSegmetedControl(currentSegment: $currentSegment)
                        .padding(.bottom)
                    VStack(content: {
                        switch currentSegment {
                        case .income: IncomesView()
                        case .expence: ExpensesView()
                        }
                    })
                    .frame(maxHeight: .infinity)
                }
                .padding(.horizontal)
            })
            .navigationTitle("Budget")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        navigationAddButtonePopUP.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .fontWeight(.semibold)
                    })
                    .popover(isPresented: $navigationAddButtonePopUP, content: {
                        PopUpView(newPurchaseType: $newPurcheaseState, navigationAddButtonePopUP: $navigationAddButtonePopUP)
                            .presentationCompactAdaptation(.popover)
                    })
                    .onChange(of: newPurcheaseState, {
                        if newPurcheaseState != nil {
                            sheetIsOpened = true
                        }
                    })
                    .sheet(isPresented: $sheetIsOpened, onDismiss: {
                        newPurcheaseState = nil
                    }, content: {
                        NavigationStack {
                            switch newPurcheaseState {
                            case .income: NewIncomeView()
                                    .navigationTitle("New income")
                                    .toolbar(content: {
                                        ToolbarItem(placement: .topBarLeading) {
                                            Button {
                                                sheetIsOpened = true
                                            }
                                        label: {
                                            Image(systemName: "chevron.backward")
                                                .fontWeight(.semibold)
                                        }
                                        }
                                    })
                            case .expence: NewExpenseView()
                                    .navigationTitle("New expense")
                                    .toolbar(content: {
                                        ToolbarItem(placement: .topBarLeading) {
                                            Button {
                                                sheetIsOpened = true
                                            }
                                        label: {
                                            Image(systemName: "chevron.backward")
                                                .fontWeight(.semibold)
                                        }
                                        }
                                    })
                            case .none:
                                Text("Error, \(String(describing: newPurcheaseState)))")
                            }
                        }
                    })
                }
            })
            
        }
    }
}
//
//#Preview {
//    BudgetView()
//}
