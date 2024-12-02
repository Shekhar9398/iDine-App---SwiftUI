//
//  MainView.swift
//  iDine
//
//  Created by Admin on 16/08/1403 AP.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
            //Menu
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            //order
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Order())
}
