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
    //MARK: - network
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
    
    //MARK: - account alert

    static let invalidForm = AlertItem(title: Text("invalid form"),
                                      message:Text("pls make sure all the field were filled out"),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("invalid email"),
                                            message:Text("pls ensure your email is correct"),
                                            dismissButton: .default(Text("OK")))
    
    static let userSavedSuccess = AlertItem(title: Text("profile saved"),
                                            message:Text("user information was saved"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("profile error"),
                                            message:Text("user information encounted an error"),
                                            dismissButton: .default(Text("OK")))
    
}


