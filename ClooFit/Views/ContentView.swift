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
            ClosetView()
                .tabItem {
                    Label("Closet", systemImage: "tag")
                }
                .tag(1)
            Palette(utente: UserAttributes(age: "18" , gender: "Male", eyeColor: "Brown", hairColor: "Brown", skinColor: "Brown", stagione: 2, isTest: true))
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
