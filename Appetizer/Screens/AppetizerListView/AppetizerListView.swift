//
//  ApptizerListView.swift
//  Appetizer
//
//  Created by apple on 2024/5/22.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
   
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){appetizer in
                   AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("appetizer")
            }
            
            .onAppear{
                viewModel.getAppetizers()
            }.blur(radius: viewModel.isShowingDetail ? 20:0)
            
            if viewModel.isShowingDetail{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
        }
        
    }
    
}

struct ApptizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
