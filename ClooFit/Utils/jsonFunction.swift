//
//  jsonFunction.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 05/07/24.
//

import Foundation

//salva l'utente in un file json
func salva(users: Utente){
    do {
        // Crea un'istanza di JSONEncoder
        let encoder = JSONEncoder()
        // Imposta l'opzione prettyPrinted per una migliore leggibilità
        encoder.outputFormatting = .prettyPrinted
        
        // Codifica l'array di utenti in dati JSON
        let jsonData = try encoder.encode(users)
        
        // Ottieni il percorso della directory dei documenti
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            // Crea il percorso completo del file
            let jsonFilePath = documentDirectory.appendingPathComponent("Utente.json")
            
            // Scrivi i dati JSON nel file
            try jsonData.write(to: jsonFilePath)
            
            print("File JSON scritto con successo a: \(jsonFilePath)")
            
            // Per visualizzare il JSON in formato stringa
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Contenuto del file JSON:\n\(jsonString)")
            }
        }
    } catch {
        print("Errore durante la scrittura del file JSON: \(error.localizedDescription)")
    }
}

// passa array article e filtra per tipo passato (top or bottom)
func typeFilter(from array: [article], type: String) -> [article]? {
    var subarray: [article] = []
    for articolo in array{
        if(articolo.type == type){
            subarray.append(articolo)
        }
    }
    return subarray
}



//vede se è abbinabile il colore (semplicemnte vedendo se è un suo complemntare più o meno) non tine condo di luminosità e saturazine però
//da usare con cura
func areColorsHarmonious(upper: article, lower: article) -> Bool {
    
    // Calcolare la tonalità complementare del primo colore
    let complementaryHue = (upper.mainColorRGB.h + 180).truncatingRemainder(dividingBy: 360)
    
    // Controllare se la differenza di tonalità è vicina a 180 gradi
    let hueDifference = abs(complementaryHue - lower.mainColorRGB.h)
    let isComplementary = hueDifference < 20 || hueDifference > 340
    
    return isComplementary
}
