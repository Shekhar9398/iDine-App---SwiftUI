//
//  iDineApp.swift
//  iDine
//
//  Created by Admin on 15/08/1403 AP.
//

import SwiftUI

@main
struct iDineApp: App {
    //Order : Must alive throughout App
    @StateObject private var order = Order()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(order)
        }
    }
}
