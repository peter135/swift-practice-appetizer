//
//  Alert.swift
//  Appetizer
//
//  Created by apple on 2024/5/23.
//

import SwiftUI

struct AlertItem:Identifiable {
    let id = UUID()
    let title:Text
    let message:Text
    let dismissButton:Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("server error "),
                                       message:Text("the data received from server was invalid, please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("server error "),
                                           message:Text("the data received from server was invalid, please contact support"),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("server error "),
                                      message:Text("there was an issue connecting to the server please contact support"),
                                      dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("server error "),
                                            message:Text("can not complete the requeset at this time, please contact support"),
                                            dismissButton: .default(Text("OK")))
}


