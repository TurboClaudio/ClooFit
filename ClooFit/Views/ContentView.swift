//
//  ContentView.swift
//  ClooFit
//
//  Created by Claudio Sottile on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
           Palette()
                .tabItem {
                    Label("Colors", systemImage: "rays")
                        .tag(0)
                }
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(1)
            Text("Closet")
                .tabItem {
                    Label("Closet", systemImage: "tag")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
