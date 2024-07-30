//
//  Extetion + View.swift
//  Sport Manager
//
//  Created by mix on 30.07.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
