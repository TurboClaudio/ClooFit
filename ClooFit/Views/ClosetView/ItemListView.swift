//
//  ItemListView.swift
//  ClooFit
//
//  Created by Paolo Sortino on 05/07/24.
//

import SwiftUI

struct ItemListView: View {
    let filteredList : [article]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing:10) {
                ForEach(filteredList) { article in
                    ItemView(item: article)
                }
            }
            .padding()
        }
    }
}

struct CategoryView: View {
    let title: String
    let filteredList: [article]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.leading)
            ItemListView(filteredList: filteredList)
        }
    }
}

struct ClosetView: View {
    let tShirt = [catalogo[0], catalogo[1]]
    let pants = [catalogo[26], catalogo[27]]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 80) {
            Text("Your Closet")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            CategoryView(title: "T-Shirt", filteredList: tShirt)
            CategoryView(title: "Pants", filteredList: pants)
            // CategoryView(title: "Sweatshirt", items: sweatshirtImages)
            
            Spacer()
        }
    }
}

#Preview {
    //ItemListView(filteredList: catalogo)
    // CategoryView(title: "T-Shirt", filteredList: catalogo)
    ClosetView()
}
