//
//  ItemDetail.swift
//  iDine
//
//  Created by Admin on 16/08/1403 AP.
//

import SwiftUI

struct ItemDetailView: View {
    
    let item : MenuItem
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                
                //Your Item Image
                Image(item.mainImage)
                
                Text("Photo: \(item.photoCredit)")
                    .padding(5)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x : -5, y: -5)
            }
            
            //Item Info
            Text(item.description)
                .padding(10)
            
            //Add this Item Button
            Button("Order This"){
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(item: MenuItem.example)
            .environmentObject(Order())
    }
}
