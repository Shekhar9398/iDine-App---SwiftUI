//
//  OrderView.swift
//  iDine
//
//  Created by Admin on 16/08/1403 AP.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationStack {
            
            List {
                //Order This (View will show after adding order)
                Section("Order This") {
                    ForEach(order.items) { item in
                        HStack(spacing : 10) {
                            
                            Label(item.name, image: item.thumbnailImage)
                            
                            Spacer()
                            
                            Text("\(item.price)$")
                        }
                        .cornerRadius(12)
                    }
                    .onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                }
              
            
                
                
                //Place order
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar{
                EditButton()
            }
           
            
            Spacer()
        }
    }
    
    //Creating a Delete functionality
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
        OrderView()
            .environmentObject(Order())
}
