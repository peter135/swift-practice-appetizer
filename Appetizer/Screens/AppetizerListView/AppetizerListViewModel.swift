//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by apple on 2024/5/23.
//

import Foundation


@MainActor final class AppetizerListViewModel:ObservableObject{
    @Published var appetizers:[Appetizer] = []
    @Published var alertItem:AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer:Appetizer?
    
    func getAppetizers(){
        isLoading = true

        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch{
                if let apError = error as? APError {
                    switch apError {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                        
                    }
                    
                }else{
                    alertItem = AlertContext.invalidResponse
                    isLoading = false
                }
            }
        }

    }
    
}
