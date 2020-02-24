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


struct YogaPoses: Codable {
    
    let id: Int
    let sanskrit_name: String
    let english_name: String
    let img_url: String
    
    
    static func getYogaPoses(from data: Data)  throws -> [YogaPoses] {
    do {
        let yoga = try JSONDecoder().decode([YogaPoses].self, from: data)
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
