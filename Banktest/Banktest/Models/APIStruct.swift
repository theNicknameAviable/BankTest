//
//  APIStruct.swift
//  Banktest
//
//  Created by Raul Bautista on 14/2/22.
//

import Foundation


// MARK: - Instruction
struct ResponseMarvel: Codable {
    let code: Int
    let data: MarvelData
}

// MARK: - DataClass
struct MarvelData: Codable {
    let results: [MarvelResult]
}

// MARK: - Result
struct MarvelResult: Codable {
    let id: Int
    let name, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
    }
}
