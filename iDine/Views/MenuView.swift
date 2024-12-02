//
//  ContentView.swift
//  iDine
//
//  Created by Admin on 15/08/1403 AP.

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var order : Order
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(menu){ section in
                    
                    Section(header: Text(section.name)) {
                        
                        ForEach(section.items){item in
                            ItemRowView(item: item)
                            
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Order())
}
