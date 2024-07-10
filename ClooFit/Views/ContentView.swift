//
//  ContentView.swift
//  ClooFit
//
//  Created by Claudio Sottile on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomePage()
                .tabItem {
                    Label("Outfits", systemImage: "tshirt.fill")
                }
                .tag(0)
            //ItemListView(filteredList: closet)
            ClosetView()
                .tabItem {
                    Label("Closet", systemImage: "tag")
                }
                .tag(1)
            Palette()
                .tabItem {
                    Label("Colors", systemImage: "rays")
                        .tag(2)
                }
        }
    }
}

#Preview {
    ContentView()
}
