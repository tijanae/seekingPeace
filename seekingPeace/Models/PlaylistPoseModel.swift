//
//  PlaylistPoseModel.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation

struct PlaylistPoseModel: Codable {
    
    let poseId: String?
    let playlistName: String?
    let duration: Double?
//    let breath: Bool
//    let audio: Bool
    
    init(poseId: String, playlistName: String, duration: Double) {
        self.poseId = poseId
        self.playlistName = playlistName
        self.duration = duration
//        self.breath = breath
//        self.audio = audio
    }

    
    init?(from dict: [String: Any]) {
        guard let poseId = dict["poseId"] as? String,
              let playlistName = dict["playlistName"] as? String,
              let duration = dict["duration"] as? Double
//              let breath = dict["breath"] as? Bool,
//              let audio = dict["audio"] as Bool
        else { return nil }
        
        self.poseId = poseId
        self.playlistName = playlistName
        self.duration = duration
        }
    
    var fieldsDict: [String: Any] {
        return [
            "poseId" : self.poseId,
            "playlistName" : self.playlistName ?? "",
            "duration" : self.duration ?? 30
//            "breath" : self.breath,
//            "audio" : self.audio
        ]
    }
}
