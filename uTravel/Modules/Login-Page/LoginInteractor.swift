//
//  LoginInteractor.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import Foundation
import Firebase
final class LoginInteractor {
	weak var output: LoginInteractorOutput?
}

extension LoginInteractor: LoginInteractorInput {
    
    func auth(withEmail: String, password: String){
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: {(result, error) in
            guard error == nil else {
                print("Invaluid login or password")
                return
            }
            print("You have login in")
        })
    }
    
    func createUser(withEmail: String, password: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password, completion: {(result, error) in
            guard error == nil else {
                print("error registration")
                return
            }
            print("You have signed in")
        })
    }
}

