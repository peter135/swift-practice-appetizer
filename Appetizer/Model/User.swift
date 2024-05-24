//
//  User.swift
//  Appetizer
//
//  Created by apple on 2024/5/24.
//

import Foundation

struct User:Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthDate           = Date()
    var extraNapkins        = false
    var frequentRefills     = false
    
    
}
