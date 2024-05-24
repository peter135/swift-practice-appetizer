//
//  APButton.swift
//  Appetizer
//
//  Created by apple on 2024/5/23.
//

import SwiftUI

struct APButton: View {
    var title:LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width:260,height: 60)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "text title")
    }
}
