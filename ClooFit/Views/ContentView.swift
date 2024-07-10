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
<<<<<<< HEAD
        TabView {
            Palette(utente:Utente(eta: 15, nome: "Franco", preferenzeStile: "bbb",  stagione: 2, isTest: false))
=======
        TabView(selection: $selectedTab) {
            HomePage()
>>>>>>> main
                .tabItem {
                    Label("Outfits", systemImage: "tshirt.fill")
                }
                .tag(0)
            ItemListView(filteredList: closet)
                .tabItem {
                    Label("Closet", systemImage: "tag")
                }
                .tag(1)
<<<<<<< HEAD
            
            Text("Closet")
=======
            Palette()
>>>>>>> main
                .tabItem {
                    Label("Colors", systemImage: "rays")
                        .tag(2)
                }
<<<<<<< HEAD
                .tag(2)
                .accentColor((Color(red: 60 / 255, green: 45 / 255, blue: 218 / 255)))
=======
>>>>>>> main
        }
        
    }
}

#Preview {
    ContentView()
        .accentColor((Color(red: 60 / 255, green: 45 / 255, blue: 218 / 255)))
}

