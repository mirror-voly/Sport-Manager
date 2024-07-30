//
//  PopUpView.swift
//  Sport Manager
//
//  Created by mix on 29.07.2024.
//

import SwiftUI

struct PopUpView: View {
    
    @Binding var newPurchaseType: NewPurchase.purchaseState?
    @Binding var navigationAddButtonePopUP: Bool
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            Color.cardBackGround
            
            VStack(alignment: .leading, content: {
                Button(action: {
                    newPurchaseType = .income
                    navigationAddButtonePopUP = false
                }, label: {
                    HStack(content: {
                        Image(systemName: "arrow.up")
                            .tint(.budgetGreen)
                            .padding(.leading)
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                        Text("New income")
                            .padding(.horizontal, 8)
                            .padding(.vertical)
                            .font(.system(size: 17))
                        Spacer()
                    })
                    
                })

                Divider().colorInvert()
                
                Button(action: {
                    newPurchaseType = .expence
                    navigationAddButtonePopUP = false
                }, label: {
                    HStack(content: {
                        Image(systemName: "arrow.down")
                            .tint(.budgetRed)
                            .padding(.leading)
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                        Text("New expense")
                            .padding(.horizontal, 8)
                            .padding(.vertical)
                            .font(.system(size: 17))
                        Spacer()
                    })
                    
                })

            })
            .clipShape(.rect(cornerRadius: 12))
        })
        
    }
}


//
//#Preview {
//    PopUpView()
//}
