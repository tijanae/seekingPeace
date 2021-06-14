//
//  FirestoreService.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/20/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation
import FirebaseFirestore

private enum FireStoreCollections: String {
    case yogis
    case yogiData
    case playlists
    case sequenceItems
}

enum SortingCriteria: String {
    case fromNewestToOldest = "dateCreated"
    var shouldSortDescending: Bool {
        switch self {
        case .fromNewestToOldest:
            return true
        }
    }
}

class FirestoreService {
    static let manager = FirestoreService()

    private let db = Firestore.firestore()

    // MARK: AppUsers
    func createAppUser(user: AppUser, completion: @escaping (Result<(), Error>) -> Void) {
        var fields = user.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.yogis.rawValue).document(user.uid).setData(fields) { (error) in
            if let error = error {
                print(error)
                completion(.failure(error))
//                print(error)
            }
            completion(.success(()))
        }
    }

    func updateCurrentUser(userName: String? = nil, photoURL: URL? = nil, completion: @escaping (Result<(), Error>) -> Void) {
        guard let userId = FirebaseAuthService.manager.currentUser?.uid else {
            // MARK: TODO - handle can't get current user
            return
        }
        var updateFields = [String: Any]()

        if let user = userName {
            updateFields["userName"] = user
        }

        if let photo = photoURL {
            updateFields["photoURL"] = photo.absoluteString
        }

        // PUT request
        db.collection(FireStoreCollections.yogis.rawValue).document(userId).updateData(updateFields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }

        }
    }

    func getAllUsers(completion: @escaping (Result<[AppUser], Error>) -> Void) {
        db.collection(FireStoreCollections.yogis.rawValue).getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let users = snapshot?.documents.compactMap({ (snapshot) -> AppUser? in
                    let userID = snapshot.documentID
                    let user = AppUser(from: snapshot.data(), id: userID)
                    return user
                })
                completion(.success(users ?? []))
            }
        }
    }

    func createYogaSequence(yogi: YogiModel, playlist: YogiPlaylistModel, poses: PlaylistPoseModel, completion: @escaping (Result<(), Error>) -> Void) {
        let yogiId = yogi.fieldsDict
        let fields = playlist.fieldsDict
        let poseData = poses.fieldsDict

        db.collection(FireStoreCollections.yogiData.rawValue).addDocument(data: yogiId) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }

        db.collection(FireStoreCollections.yogiData.rawValue).document().collection(FireStoreCollections.playlists.rawValue).addDocument(data: fields)
        { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
        //  db.collection(FireStoreCollections.playlists.rawValue).document().collection(FireStoreCollections.sequenceItems.rawValue).document().collection(FireStoreCollections.sequenceItems.rawValue).addDocument(data: poseData)
                //        {(error) in
                //            if let error = error {
                //                completion(.failure(error))
                //            } else {
                //                completion(.success(()))
                //            }
                //
                //        }

    }

    private init () {}
}
