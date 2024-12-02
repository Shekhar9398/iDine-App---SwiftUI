//
//  ItemRow.swift
//  iDine
//
//  Created by Admin on 16/08/1403 AP.
//

import SwiftUI

struct ItemRowView: View {
    
    let item: MenuItem 
    
    let colors : [String : Color] = ["D" : .pink, "G" : .black, "S" : .mint, "N" : .yellow, "V" : .purple]
    
    var body: some View {
        NavigationLink(destination: ItemDetailView(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment : .leading) {
                    Text(item.name)
                    Text("$\(item.price)")
                }
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) {restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(self.colors[restriction])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    //We must pass the values
    ItemRowView(item: MenuItem.example)
}
