//
//  ItemViewDetail.swift
//  ClooFit
//
//  Created by Paolo Sortino on 08/07/24.
//

import SwiftUI

// 167, 115
// 220, 168

struct ItemViewDetail: View {
    var item: article
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            item.image
            
            Text(item.mainColor.capitalized + " " + item.name.capitalized)
                .font(.largeTitle)
                .bold()
            HStack {
                Image(systemName: "tshirt")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text("\(item.material)")
                    .font(.system(size: 25))
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "graduationcap")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text("\(item.elegance)")
                    .font(.system(size: 25))
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "cloud.sun")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text("\(item.weather)")
                    .font(.system(size: 25))
            }
            .padding(.horizontal)
            
            // Text("Material: \(item.material)")
            // Text("Color: \(item.mainColor)")
            // Text("Elegance: \(item.elegance)")
            // Text("Weather: \(item.weather)")
            Spacer()
        }
        .padding()
        // .navigationTitle(item.name)
    }
}



#Preview {
    ItemViewDetail(item: catalogo[2])
}
