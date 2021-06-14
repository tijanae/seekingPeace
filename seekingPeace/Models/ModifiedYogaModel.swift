//
//  ModifiedYogaModel.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/4/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import Foundation

enum ModifiedYogaJSON: Error {
    case decodingError(Error)
}

struct ModifiedYogaPose: Codable {

    let yogaId: Int
    let sanskrit: String
    let english: String
//    let img_url: String
    
    enum CodingKeys: String, CodingKey {
        case yogaId = "id"
        case sanskrit = "sanskrit_name"
        case english = "english_name"
        
    }

    static func getModifiedYogaPoses(from data: Data)  throws -> [YogaPose] {
    do {
        let yoga = try JSONDecoder().decode([YogaPose].self, from: data)
        return yoga
    } catch {
        throw YogaJSON.decodingError(error)
    }

    }
}
