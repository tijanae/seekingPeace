//
//  FirebaseAuthService.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/20/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService {

    static let manager = FirebaseAuthService()

    private let auth = Auth.auth()

    var currentUser: User? {
        return auth.currentUser
    }

    func createNewUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let createdUser = result?.user {
                completion(.success(createdUser))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func updateUserFields(userName: String? = nil, photoURL: URL? = nil, completion: @escaping (Result<(), Error>) -> Void) {
        let changeRequest = auth.currentUser?.createProfileChangeRequest()
        if let userName = userName {
            changeRequest?.displayName = userName
        }
        if let photoURL = photoURL {
            changeRequest?.photoURL = photoURL
        }
        changeRequest?.commitChanges(completion: { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        })
    }

    func loginUser(email: String, password: String, completion: @escaping (Result<(), Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let user = result?.user {
                completion(.success(()))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func signOut() {
        do {
            try auth.signOut()

        } catch {
            print(error)
        }
    }

    private init () {}

}
