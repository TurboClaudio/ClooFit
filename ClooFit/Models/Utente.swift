//
//  Utente.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 05/07/24.
//

import Foundation


struct Utente: Codable{
    var age: Int
    var gender: String
    var eyeColor: String
    var eyeColorRGB: colorRGB
    var hairColor: String
    var hairColorRGB: colorRGB
    var skinColor: String
    var skinColorRGB: colorRGB
    /*var stagione: Int{
        return getStagione()
    }*/
    var isTest: Bool
}
