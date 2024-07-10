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
    var hairColor: String?
    var skinColor: String?
    var stagione: Int?
    var isTest: Bool
}


