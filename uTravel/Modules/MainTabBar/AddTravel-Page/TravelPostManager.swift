//
//  TravelpostManager.swift
//  uTravel
//
//  Created by Dmitry on 05.05.2021.
//

import Foundation
import Firebase
import FirebaseFirestore


enum NetworkError: Error {
    case unexpected
}

protocol UsersManagerDescription {
    func create(user: User, completion: @escaping (Error?) -> Void)
    func observePosts(completion: @escaping (Result<[User], Error>) -> Void)
}

final class UsersManager: UsersManagerDescription {
    static let shared: UsersManagerDescription = UsersManager()
    
    private let database = Firestore.firestore()

    private init() {}
    
    func create(user: User, completion: @escaping (Error?) -> Void) {
        let data = UserConverter.dict(from: user)
        database.collection("users").addDocument(data: data, completion: completion)
    }
    
    func observePosts(completion: @escaping (Result<[User], Error>) -> Void) {
        database.collection("users").whereField("email", isEqualTo: getEmail())
            .addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                completion(.failure(NetworkError.unexpected))
                return
            }
            
            let users = documents.compactMap { UserConverter.user(from: $0) }
            completion(.success(users))
        }
    }
    
    func getEmail() -> String {
        return Auth.auth().currentUser?.email ?? "nil"
    }
}

private final class UserConverter {
    enum Key: String {
        case email
        case travels
    }
    
    static func user(from document: DocumentSnapshot) -> User? {
        guard
            let dict = document.data(),
            let email = dict[Key.email.rawValue] as? String,
            let travels = dict[Key.travels.rawValue] as? [Travel]
        else {
            return nil
        }
        
        return User(identifier: document.documentID, email: email,travels: travels)
    }
    
    static func dict(from user: User) -> [String: Any] {
        var data: [String: Any] = [:]
        
        data[Key.email.rawValue] = user.email
        data[Key.travels.rawValue] = user.travels
        //user.image.map { data[Key.image.rawValue] = $0 }

        return data
    }
}
