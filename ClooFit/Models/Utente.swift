//
//  Utente.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 05/07/24.
//

import Foundation
var user: UserAttributes = load("stats.json")

struct UserAttributes: Codable {
    var age: String
    var gender: String
    var eyeColor: String?
    var hairColor: String?
    var skinColor: String?
    var stagione: Int?
    var isTest: Bool

    enum CodingKeys: String, CodingKey {
        case age = "selectedAge"
        case gender = "selectedGender"
        case eyeColor = "selectedEyeColor"
        case hairColor = "selectedHairColor"
        case skinColor = "selectedSkinColor"
        case stagione = "selectedStagione"
        case isTest = "selectedisTest"
    }
}




func loadUserAttributes(from fileName: String) -> UserAttributes? {
    let decoder = JSONDecoder()

    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        print("Failed to access document directory.")
        return nil
    }

    let fileURL = documentDirectory.appendingPathComponent("\(fileName).json")

    // Check if the file exists
    if !FileManager.default.fileExists(atPath: fileURL.path) {
        print("File not found at: \(fileURL.path)")
        return nil
    }

    do {
        let data = try Data(contentsOf: fileURL)
        let decodedAttributes = try decoder.decode(UserAttributes.self, from: data)
        return decodedAttributes
    } catch {
        print("Failed to decode \(fileName).json: \(error.localizedDescription)")
        return nil
    }
}



