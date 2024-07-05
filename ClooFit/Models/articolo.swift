//
//  articolo.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 05/07/24.
//

import Foundation
import SwiftUI

struct colorRGB: Codable {
    var r: Double
    var g: Double
    var b: Double
    
    var norm_r: Double{
        r/255
    }
    
    var norm_g: Double{
        g/255
    }
    
    var norm_b: Double{
        b/255
    }
}

struct article: Codable{
    var id: String
    var gender: String
    var name: String
    var material: String
    var mainColor: String
    var mainColorRGB: colorRGB
    var type: String
    var elegance: String
    var weather: String
    
    var image: Image {
        Image(id)
    }
    
   
}

/*
 "id": "SO01",
 "gender": "unisex",
 "name": "t-shirt",
 "material": "cotton",
 "mainColor": "black",
 "mainColorRGB" : {
     "r" : 0,
     "g" : 0,
     "b" : 0
 },
 "type" : "top",
 "elegance" : "informal",
 "weather" : "hot"
 */

