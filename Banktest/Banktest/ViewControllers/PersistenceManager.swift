//
//  PersistenceManager.swift
//  Banktest
//
//  Created by Raul Bautista on 16/2/22.
//

import Foundation
import UIKit

protocol PersistenceManager {
    func save(objet: [Result]) -> Bool
    func read() -> [Result]
}

// MARK: - Save & Read on Disc
class PlistPersistenceManager: PersistenceManager{
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths [0]
        return documentsDirectory
    }
    
    func getFilePath() -> URL {
        let path = getDocumentsDirectory()
        return path.appendingPathComponent("data_saved.plist")
    }
    
    func save(objet: [Result]) -> Bool{
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        let path = getFilePath()
        do{
            let data = try encoder.encode(objet)
            try data.write(to: path)
            return true
        }
        catch{
           print(error)
            return false
        }
    }
    
    func read() -> [SearchItem]{
        let path = getFilePath()
        let decoder = PropertyListDecoder()
        do{
            let xml = try Data(contentsOf: path)
            let object = try decoder.decode([SearchItem].self, from: xml)
            return object
        }
        catch{
            print(error)
            return []
        }
    }
}

