//
//  AccountView.swift
//  Appetizer
//
//  Created by apple on 2024/5/22.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField:FormTextFiled?
    
    enum FormTextFiled {
        case firstName, lastName, email
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal info")) {
                    TextField("firstName",text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("lastName",text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)

                    
                    TextField("email",text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
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
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("dismiss"){ focusedTextField = nil}
                }
            }
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
