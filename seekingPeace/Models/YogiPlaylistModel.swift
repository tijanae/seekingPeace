//
//  YogiPlaylistModel.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation

struct YogiPlaylistModel: Codable {
    
    let playlistId: String
    let playlistName: String?
//    let dateCreated: Date?
    let sequenceItemId: String?
//    let playlistStatus: Bool?
    let yogiId: String
    let id: String
//    let playlistImage: String
    
    init(playlistId: String, playlistName: String, sequenceItemId: String, playlistStatus: Bool, yogiId: String) {
        self.playlistId = playlistId
        self.playlistName = playlistName
        self.sequenceItemId = sequenceItemId
//        self.playlistStatus = playlistStatus
        self.yogiId = yogiId
        self.id = UUID().description
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let playlistId = dict["playlistId"] as? String,
              let playlistName = dict["playlistName"] as? String,
              let sequenceItemId = dict["sequenceItemId"] as? String,
//              let playlistStatus = dict["playlistStatus"] as Bool,
              let yogiId = dict["yogiId"] as? String else { return nil }
        
        self.playlistId = playlistId
        self.playlistName = playlistName
        self.sequenceItemId = sequenceItemId
//        self.playlistStatus = playlistStatus
        self.yogiId = yogiId
        self.id = id
    }
    
    var fieldsDict: [String: Any] {
        return [
            "playlistId" : self.playlistId,
            "playlistName" : self.playlistName ?? "",
            "sequenceItemId" : self.sequenceItemId ?? "",
//            "playlistStatus" : self.playlistStatus ?? false,
            "yogiId" : self.yogiId
        ]
    }
}

