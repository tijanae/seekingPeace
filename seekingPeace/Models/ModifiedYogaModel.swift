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

    let id: Int
    let sanskrit_name: String
    let english_name: String
//    let img_url: String

    static func getModifiedYogaPoses(from data: Data)  throws -> [YogaPose] {
    do {
        let yoga = try JSONDecoder().decode([YogaPose].self, from: data)
        return yoga
    } catch {
        throw YogaJSON.decodingError(error)
    }

    }
}
