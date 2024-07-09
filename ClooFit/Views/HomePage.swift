//
//  HomePage.swift
//  ClooFit
//
//  Created by Claudio Sottile on 03/07/24.
//

import SwiftUI

var outfits = [generateOutfit(array: catalogo, weather: "cold", gender: "unisex", elegance: "informal"), generateOutfit(array: catalogo, weather: "cold", gender: "unisex", elegance: "informal")]

var uppers = typeFilter(from: catalogo, type: "top")
var lowers = typeFilter(from: catalogo, type: "bottom")

struct HomePage: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(outfits) { outfit in
                        NavigationLink(destination: ChooseAnOutfit(upperSelected: outfit.upper, lowerSelected: outfit.lower, currentUpperIndex: getIndexCapo(array: uppers ?? [], id: outfit.upper.id), currentLowerIndex: getIndexCapo(array: lowers ?? [], id: outfit.lower.id))) {
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
