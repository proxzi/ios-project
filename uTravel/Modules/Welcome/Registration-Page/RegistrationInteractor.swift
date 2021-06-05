//
//  RegistrationInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import Firebase
import FirebaseDatabase

final class RegistrationInteractor {
	weak var output: RegistrationInteractorOutput?
    
    private var user: User!
    private var ref: DatabaseReference!
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    private var userData: UserData!
}

extension RegistrationInteractor: RegistrationInteractorInput {
    
    func createUser(user: UserData, password: String) {
        Auth.auth().createUser(withEmail: user.email, password: password, completion: {(result, error) in
            guard error == nil else {
                print("error registration: \(error!)")
                return
            }
            print("You have signed in")
            self.createUserData(user: user)
        })
    }
    
    func createUserData(user: UserData){
        guard let currentUser = Auth.auth().currentUser else { return }
        self.user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users")
        self.userData = user
        imageUpload(image: userData.profileImage!, title: "profile image")
    }
    
    func updateJSON() {
        let userRef = self.ref.child(self.user.uid)
        userRef.setValue(userData.convertToDictionary())
        self.output?.successfulRegistration()
    }
    
    func imageUpload(image: UIImage, title: String){
        imageLoader.upload(image: image) { [weak self] (result) in
            switch result {
            case .success(let name):
                self?.userData.profileImageString = name
                self?.imageLoader.upload(image: (self?.userData.backgroundImage!)!) { [weak self] (result) in
                    switch result {
                    case .success(let name):
                        self?.userData.backgroundImageString = name
                        self?.updateJSON()
                    case .failure(let error):
                        print("registration interactor error: \(error)")
                    }
                }
            case .failure(let error):
                print("registration interactor error: \(error)")
            }
        }
    }
}
