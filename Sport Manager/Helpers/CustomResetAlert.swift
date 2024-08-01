//
//  CustomResetAlert.swift
//  Sport Manager
//
//  Created by mix on 31.07.2024.
//

import SwiftUI

struct CustomResetAlert: View {
    
    @Binding var resetAlert: Bool
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0, content: {
            VStack(content: {
                Text("Reset Confirmation")
                    .font(.system(size: 17))
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2)
                Text("Your progress will be permanently reset. Do you really want to delete all data?")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
            })
            .padding(.horizontal)
            .padding(.top)
                Divider()
                Button {
                    dataManager.resetAll()
                    resetAlert = false
                } label: {
                    Text("Reset")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.system(size: 17))
                        .frame(height: 44)
                }
                .tint(.white)
                
                Divider()
                
                Button {
                    resetAlert = false
                } label: {
                    Text("Cancel")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.system(size: 17))
                        .frame(height: 44)
                }
                .tint(.settingsRed)
            
        })
        .background(.settingrsAlertBackground)
        .frame(width: 270)
        .clipShape(.rect(cornerRadius: 16))
    }
}

//#Preview {
//    CustomResetAlert()
//}
