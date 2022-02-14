//
//  APIStruct.swift
//  Banktest
//
//  Created by Raul Bautista on 14/2/22.
//

import Foundation
import Alamofire
import UIKit


// MARK: - Instruction
struct responseMarvel: Codable {
    let code: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
    }
}
