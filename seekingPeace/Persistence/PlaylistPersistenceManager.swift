//
//  PlaylistPersistenceManager.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/16/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation

struct PlaylistPersistenceManager {

    private init() {}

    static let manager = PlaylistPersistenceManager()

    private let persistenceHelper = PersistenceHelper<PlaylistPersisted>(fileName: "playlistPersisted.plist")

    func savePlaylist(playlistData: PlaylistPersisted) throws {
        try persistenceHelper.save(newElement: playlistData)
    }

    func getPlaylist() throws -> [PlaylistPersisted] {
        return try persistenceHelper.getObjects()
    }

    func deletePlaylist(playlist: [PlaylistPersisted], atIndex: Int) throws {
        try persistenceHelper.delete(elements: playlist, index: atIndex)
    }
}
