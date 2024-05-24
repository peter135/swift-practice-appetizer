//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by apple on 2024/5/22.
//

import SwiftUI

@main
struct AppetizerApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
