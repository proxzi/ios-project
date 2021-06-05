//
//  SearchUsersInteractor.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation
import Firebase
import FirebaseDatabase

final class SearchUsersInteractor {
	weak var output: SearchUsersInteractorOutput?
    
    private var ref: DatabaseReference!
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    
    private var users = Array<UserData>()
}

extension SearchUsersInteractor: SearchUsersInteractorInput {
    func updateUserList() {
        ref = Database.database().reference(withPath: "users")
        users.removeAll()
        ref.observe(.value, with: { [weak self] (snapshot) in
            for item in snapshot.children {
                var user = UserData(snapshot: item as! Firebase.DataSnapshot)
                self?.imageLoader.image(with: user.profileImageString, completion: { [weak self] (result) in
                    switch result {
                    case .success(let image):
                        user.profileImage = image
                        self?.users.append(user)
                        if self?.users.count == Int(snapshot.childrenCount) {
                            self?.output?.loadedUserList(users: (self?.users)!)
                        }
                    case .failure(let error):
                        print("searchinteractor: \(error)")
                        
                        self?.users.append(user)
                        self?.output?.loadedUserList(users: (self?.users)!)
                    }
                })
//                self?.users.append(user)
//                self?.output?.loadedUserList(users: (self?.users)!)
            }
        })
    }
}
