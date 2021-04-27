//
//  RegistrationInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import Firebase
final class RegistrationInteractor {
	weak var output: RegistrationInteractorOutput?
}

extension RegistrationInteractor: RegistrationInteractorInput {
    
    func createUser(withEmail: String, password: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password, completion: {(result, error) in
            guard error == nil else {
                print("error registration")
                return
            }
            print("You have signed in")
            self.output?.successfulRegistration()
        })
    }
}
