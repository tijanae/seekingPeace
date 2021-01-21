//
//  PlaylistPersisted.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/16/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation

struct PlaylistPersisted: Codable {
    let playlistName: String
//    let dateCreated: Date
    let sequenceItem: [SequenceItem]
    let sequenceImageData: Data

}

struct SequenceItem: Codable {
//    let poseId: Int
//    let poseName: String
    let poseDuration: Int
    let hasAudio: Bool
    let yogaPose: YogaPose
    
}
