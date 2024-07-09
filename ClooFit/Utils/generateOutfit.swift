//
//  generateOutfit.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 09/07/24.
//

import Foundation

func generateOutfit(array:[article], weather: String, gender: String, elegance: String) -> Outfit{
    var upper: article
    var lower: article
    var subArray: [article] = weatherFilter(from: genderFilter(from: eleganceFilter(from: typeFilter(from: array, type: "top") ?? array , elegance: elegance) ?? array , gender: gender) ?? array , weather: weather) ?? array
    upper = subArray.randomElement() ?? catalogo[2]
    subArray = weatherFilter(from: genderFilter(from: eleganceFilter(from: typeFilter(from: array, type: "bottom") ?? catalogo, elegance: elegance) ?? catalogo, gender: gender) ?? catalogo, weather: weather) ?? catalogo
    var count = 0
    repeat{
        lower = subArray.randomElement() ?? catalogo[32]
        count += 1
    }while(areColorsHarmonious(upper: upper, lower: lower) && count <= 10)
    
    return Outfit(upper: upper, lower: lower)
    
    
    
}

/*notDefaultFilter(array: [Outfit]) -> [Outfit]{
    
}*/
