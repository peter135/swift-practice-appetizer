//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by apple on 2024/5/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order:Order
    
    let appetizer:Appetizer
    @Binding var isShowingDetail:Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40){
                    NutritionInfo(title: "calories", value: appetizer.calories)
                    NutritionInfo(title: "carbs", value: appetizer.carbs)
                    NutritionInfo(title: "protein", value: appetizer.protein)
                }
                
            }
            
            Spacer()
            
            Button{
                order.add(appetizer)
                isShowingDetail = false
            }label: {
                Text("$\(appetizer.price,specifier: "%.2f") - add to order")
//                APButton(title: "$\(appetizer.price,specifier: "%.2f") - add to order")
            }
            .modifier(StandardButtonStyle())
//            .buttonStyle(.bordered)
//            .tint(.brandPrimary)
//            .controlSize(.large)
            .padding(.bottom,30)
            
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        } label: {
           XDismissButton()
        },alignment: .topTrailing
        )
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(true))
    }
}


struct NutritionInfo:View {
    let title:String
    let value:Int
    
    var body: some View{
        VStack(spacing:5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
        
    }
    
    
}

