//
//  OrderView.swift
//  Appetizer
//
//  Created by apple on 2024/5/22.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order:Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: {indexSet in
                            order.deleteItems(at: indexSet)
                        })
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button{
                        print("save success")
                    }label: {
                        APButton(title: "$\(order.totalPrice,specifier: "%.2f") - place order")
                    }
                    .padding(.bottom,25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "you have no items on your order, pls add an appetizer")
                }
                
            }
           .navigationTitle("order")
        }

    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
