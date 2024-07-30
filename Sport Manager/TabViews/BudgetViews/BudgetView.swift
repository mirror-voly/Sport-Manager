//
//  BudgetView.swift
//  Sport Manager
//
//  Created by mix on 23.07.2024.
//

import SwiftUI

struct BudgetView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    @State var sheetIsOpened = false
    @State var navigationAddButtonePopUP = false
    @State var currentNewPurcheaseState: NewPurchase.NewPurchaseState?

    
    var body: some View {
        
        NavigationStack {
            ZStack(content: {
                Color(.mainBackground)
                    .ignoresSafeArea()
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
                        PopUpView(newPurchaseType: $currentNewPurcheaseState, navigationAddButtonePopUP: $navigationAddButtonePopUP)
                            .presentationCompactAdaptation(.popover)
                    })
                    .onChange(of: currentNewPurcheaseState, {
                        if currentNewPurcheaseState != nil {
                            sheetIsOpened = true
                        }
                    })
                    .sheet(isPresented: $sheetIsOpened, onDismiss: {
                        currentNewPurcheaseState = nil
                    }, content: {
                        NavigationStack {
                            
                        
                        switch currentNewPurcheaseState {
                        case .newIncome: NewIncomeView()
                                .navigationTitle("New income")
                                .toolbarRole(.editor)
                        case .newExpence: NewExpenseView()
                                .navigationTitle("New expense")
                                .toolbarRole(.editor)
                        case .none:
                            Text("Error, \(String(describing: currentNewPurcheaseState)))")
                        }
                        }
                    })

                }
            })
            
        }
        
    }
}

#Preview {
    BudgetView()
}
