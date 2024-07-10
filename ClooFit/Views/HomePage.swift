//
//  HomePage.swift
//  ClooFit
//
//  Created by Claudio Sottile on 03/07/24.
//

import SwiftUI

var uppersUnfiltered = typeFilter(from: catalogo, type: "top")
var uppersUnfiltered2 = genderFilter(from: uppersUnfiltered ?? [], gender: "man")
var uppers = eleganceFilter(from: uppersUnfiltered2 ?? [], elegance: "informal")

var lowersUnfiltered = typeFilter(from: catalogo, type: "bottom")
var lowersUnfiltered2 = genderFilter(from: lowersUnfiltered ?? [], gender: "man")
var lowers = eleganceFilter(from: lowersUnfiltered2 ?? [], elegance: "informal")

struct HomePage: View {
    
    @State var informalOutfits = [generateOutfit(array: catalogo, weather: "cold", gender: "unisex", elegance: "informal"), generateOutfit(array: catalogo, weather: "cold", gender: "unisex", elegance: "informal")]
    @State var formalOutfits = [generateOutfit(array: catalogo, weather: "cold", gender: "unisex", elegance: "formal"), generateOutfit(array: catalogo, weather: "cold", gender: "unisex", elegance: "formal")]
    
    @State var defaultOutfit = Outfit(upper: catalogo[2], lower: catalogo[26])
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    NavigationLink(destination: ChooseAnOutfit(vestiti_eleganti: false, upperSelected: defaultOutfit.upper, lowerSelected: defaultOutfit.lower, currentUpperIndex: 0, currentLowerIndex: 0)) {
                        NewOutfitRow()
                            .background(Color(red: (57.0 / 255.0), green: (46.0 / 255.0), blue: (210.0/255.0)))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal, 20)
                    }
                    ForEach(informalOutfits) { outfit in
                        NavigationLink(destination: ChooseAnOutfit(vestiti_eleganti: false, upperSelected: outfit.upper, lowerSelected: outfit.lower, currentUpperIndex: getIndexCapo(array: uppers ?? [], id: outfit.upper.id), currentLowerIndex: getIndexCapo(array: lowers ?? [], id: outfit.lower.id))) {
                            SuggestionRow(outfit: outfit)
                                .background(Color(red: (245.0 / 255.0), green: (245.0 / 255.0), blue: (247.0/255.0)))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding(.horizontal, 20)
                        }
                    }
                    ForEach(formalOutfits) { outfit in
                        NavigationLink(destination: ChooseAnOutfit(vestiti_eleganti: true, upperSelected: outfit.upper, lowerSelected: outfit.lower, currentUpperIndex: getIndexCapo(array: uppers ?? [], id: outfit.upper.id), currentLowerIndex: getIndexCapo(array: lowers ?? [], id: outfit.lower.id))) {
                            SuggestionRow(outfit: outfit)
                                .background(Color(red: (245.0 / 255.0), green: (245.0 / 255.0), blue: (247.0/255.0)))
                                .cornerRadius(10)
                                .shadow(radius: 5)
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
