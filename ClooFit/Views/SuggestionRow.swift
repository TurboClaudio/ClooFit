//
//  SuggestionRow.swift
//  ClooFit
//
//  Created by Claudio Sottile on 04/07/24.
//

import SwiftUI

struct SuggestionRow: View {
    
    var outfit: Outfit
    
    var body: some View {
        HStack {
            
            // Color preview and color label
            
            VStack (alignment: .leading){
                HStack {
                    Circle().fill(Color(red: outfit.upper.mainColorRGB.norm_r, green: outfit.upper.mainColorRGB.norm_g, blue: outfit.upper.mainColorRGB.norm_b))
                        .frame(width: 20)
                        .padding()
                    Text(outfit.upper.mainColor.capitalized)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, -10)
                        .foregroundColor(.black)
                    
                }
                HStack {
                    Circle().fill(Color(red: outfit.lower.mainColorRGB.norm_r, green: outfit.lower.mainColorRGB.norm_g, blue: outfit.lower.mainColorRGB.norm_b))
                        .frame(width: 20)
                        .padding()
                    Text(outfit.lower.mainColor.capitalized)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, -10)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            
            // Images
            
            VStack {
                outfit.upper.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 136, height: 91)
                    .shadow(radius: 5)
                outfit.lower.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 102, height: 102)
                    .offset(y: -25)
                    .padding(.bottom, -1)
                    .shadow(radius: 5)
            }
        }
        .background(Color(red: (245.0 / 255.0), green: (245.0 / 255.0), blue: (247.0/255.0)))
        .cornerRadius(10)
        .padding(.horizontal, 30)
    }
}

#Preview {
    Group {
        SuggestionRow(outfit: Outfit(upper: catalogo[0], lower: catalogo[31]))
        SuggestionRow(outfit: Outfit(upper: catalogo[1], lower: catalogo[30]))
        SuggestionRow(outfit: Outfit(upper: catalogo[33], lower: catalogo[29]))
    }
}
