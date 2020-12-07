//
//  YogiModel.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation

struct YogiModel: Codable {
    
    let userName: String?
    let yogiId: String
    let id: String
    
    init(user: String,yogiId: String) {
        self.userName = user
        self.yogiId = yogiId
        self.id = UUID().description
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let userName = dict["userName"] as? String,
              let yogiId = dict["yogiId"] as? String else { return nil }
        
        self.userName = userName
        self.yogiId = yogiId
        self.id = id
    }
    
    var fieldsDict: [String: Any] {
        return [
            "userName" : self.userName ?? "",
            "yogiId" : self.yogiId
        ]
    }
    
}
