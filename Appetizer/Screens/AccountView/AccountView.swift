//
//  AccountView.swift
//  Appetizer
//
//  Created by apple on 2024/5/22.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal info")) {
                    TextField("firstName",text: $viewModel.user.firstName)
                    TextField("lastName",text: $viewModel.user.lastName)
                    TextField("email",text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("birthday", selection: $viewModel.user.birthDate,displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("save changes")
                    }

                }
                
                Section(header: Text("request")) {
                    Toggle("extra napkins",isOn: $viewModel.user.extraNapkins)
                    Toggle("frequent refills",isOn: $viewModel.user.frequentRefills)

                }.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle("account")
        }
        
        .onAppear{
            viewModel.retrieveUser()
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
