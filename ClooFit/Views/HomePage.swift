//
//  HomePage.swift
//  ClooFit
//
//  Created by Claudio Sottile on 03/07/24.
//

import SwiftUI

import SwiftUI

struct HomePage: View {
    // Sample data
    let outfits: [Outfit] = [
        Outfit(upper: catalogo[0], lower: catalogo[31]),
        Outfit(upper: catalogo[1], lower: catalogo[30]),
        Outfit(upper: catalogo[33], lower: catalogo[29])
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(outfits) { outfit in
                        NavigationLink(destination: ChooseAnOutfit(outfit: outfit)) {
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
