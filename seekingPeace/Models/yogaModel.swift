//
//  yogaModel.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation

enum YogaJSON: Error {
    case decodingError(Error)
}

struct YogaPose: Codable {

    let yogaId: Int
    let sanskrit: String
    let english: String
//    let img_url: String
    
    enum CodingKeys: String, CodingKey {
        case yogaId = "id"
        case sanskrit = "sanskrit_name"
        case english = "english_name"
        
    }

    static func getYogaPoses(from data: Data)  throws -> [YogaPose] {
    do {
        let yoga = try JSONDecoder().decode([YogaPose].self, from: data)
        return yoga
    } catch {
        throw YogaJSON.decodingError(error)
    }

    }
    /*
     static func getColorData(from data: Data) throws -> [colorInfo]{
         do {
             let color = try JSONDecoder().decode(Color.self, from: data)
             return color.colors
         } catch {
             throw colorJSON.decodingError(error)
         }
     }
     */

}
