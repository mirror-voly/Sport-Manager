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
//    @State var currentNewPurcheaseState: Coordinator.NewPurchaseState?

    
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
                        PopUpView(newPurchaseType: $coordinator.newPurchease, navigationAddButtonePopUP: $navigationAddButtonePopUP)
                            .presentationCompactAdaptation(.popover)
                            .onDisappear {
                                if $coordinator.newPurchease != nil {
                                    sheetIsOpened = true
                                }
                                
                            }
                    })
                    .sheet(isPresented: $sheetIsOpened, onDismiss: {
                        coordinator.newPurchease = nil
                    }, content: {
                        switch coordinator.newPurchease {
                        case .newIncome: NewIncomeView()
                        case .newExpence: NewExpenseView()
                        case .none:
                            Text("nothing").onAppear {
                                print(coordinator.newPurchease)
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
