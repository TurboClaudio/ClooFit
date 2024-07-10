//
//  Utente.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 05/07/24.
//

import Foundation
var user: Utente = load("stats.json")

struct Utente: Codable{
    var age: String
    var gender: String
    var eyeColor: String?
    var eyeColorRGB: colorRGB?
    var hairColor: String?
    var hairColorRGB: colorRGB?
    var skinColor: String?
    var skinColorRGB: colorRGB?
    var stagione: Int?
    var isTest: Bool
}
