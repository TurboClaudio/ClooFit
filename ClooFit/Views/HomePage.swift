//
//  HomePage.swift
//  ClooFit
//
//  Created by Claudio Sottile on 03/07/24.
//

import SwiftUI

// CS Inizializzazione fittizia di uppers e lowers, va fatta con qualche algoritmo

var uppers: [article] = [catalogo[2], catalogo[3], catalogo[4]]
var lowers: [article] = [catalogo[27], catalogo[28], catalogo[29]]

struct HomePage: View {
    // Sample data
    let outfits: [Outfit] = [
        Outfit(upper: catalogo[2], lower: catalogo[27]),
        Outfit(upper: catalogo[3], lower: catalogo[28]),
        Outfit(upper: catalogo[4], lower: catalogo[29])
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(outfits) { outfit in
                        NavigationLink(destination: ChooseAnOutfit()) {
                            SuggestionRow(outfit: outfit)
                                .background(Color(red: (245.0 / 255.0), green: (245.0 / 255.0), blue: (247.0/255.0)))
                                .cornerRadius(10)
                                .padding(.horizontal, 20)
                        }
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Choose an Outfit")
        }
    }
}

#Preview {
    HomePage()
}
