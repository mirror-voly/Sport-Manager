//
//  PickerViewItem.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

struct CustomSegmetedControl: View {
    
    @Binding var currentSegment: NewPurchase.PurchaseState
    private let allCases = NewPurchase.PurchaseState.allCases
    
    var body: some View {
        HStack(spacing: 0, content: {
            ForEach(allCases, id: \.self) { caseOn in
                ZStack {
                    if currentSegment.rawValue == caseOn.rawValue {
                        Color.buttonColorActive
                        Text(caseOn.rawValue)
                            .font(.system(size: 15))
                    } else {
                        Color.cardBackGround
                        Text(caseOn.rawValue)
                            .colorMultiply(.mainPlaceholder)
                            .font(.system(size: 15))
                    }
                    
                }
                .clipShape(.rect(cornerRadius: 10))
                .onTapGesture {
                    currentSegment = caseOn
                }
            }
        })
        .frame(height: 46)
            .background(Color.cardBackGround)
            .clipShape(.rect(cornerRadius: 10))
        
      
        
    }
}

#Preview {
    CustomSegmetedControl(currentSegment: .constant(.income))
}
