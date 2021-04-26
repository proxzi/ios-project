//
//  LoginProtocols.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import Foundation

protocol LoginModuleInput {
	var moduleOutput: LoginModuleOutput? { get }
}

protocol LoginModuleOutput: AnyObject {
}

protocol LoginViewInput: AnyObject {
}

protocol LoginViewOutput: AnyObject {
    func didTapLoginButton(email: String, password: String)
    func didTapRegistrationLabel()
}

protocol LoginInteractorInput: AnyObject {
    func auth(withEmail: String, password: String)
    func createUser(withEmail: String, password: String)
}

protocol LoginInteractorOutput: AnyObject {
}

protocol LoginRouterInput: AnyObject {
    func openRegistration()
    func openMain()
}

protocol RegistrationViewInput: AnyObject {
}

protocol RegistrationViewOutput: AnyObject {
    func didTapRegButton(email: String, password: String)
}
