//
//  CustomModifiers.swift
//  Appetizer
//
//  Created by apple on 2024/5/25.
//

import SwiftUI

struct StandardButtonStyle:ViewModifier{
    
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
    
}

extension View {
    func standardButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
}
