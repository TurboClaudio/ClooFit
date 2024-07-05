//
//  jsonFunction.swift
//  ClooFit
//
//  Created by Oteri Salvatore on 05/07/24.
//

import Foundation


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
