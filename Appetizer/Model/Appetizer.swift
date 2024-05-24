//
//  Appetizer.swift
//  Appetizer
//
//  Created by apple on 2024/5/22.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id:Int
    let name:String
    let description:String
    let price:Double
    let imageURL:String
    let calories:Int
    let protein:Int
    let carbs:Int
}

struct AppetizerResponse:Decodable{
    let request:[Appetizer]
    
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "test appetizer",
                                           description: "its yummy",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
}
