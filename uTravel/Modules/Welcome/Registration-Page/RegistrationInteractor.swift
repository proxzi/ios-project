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
}

extension RegistrationInteractor: RegistrationInteractorInput {
    
    func createUser(user: UserData, password: String) {
        Auth.auth().createUser(withEmail: user.email, password: password, completion: {(result, error) in
            guard error == nil else {
                print("error registration")
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
        let userRef = self.ref.child(self.user.uid)
        userRef.setValue(user.convertToDictionary())
        self.output?.successfulRegistration()
    }
}
