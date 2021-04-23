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
    func didTapLoginButton()
    func didTapRegistrationLabel()
}

protocol LoginInteractorInput: AnyObject {
}

protocol LoginInteractorOutput: AnyObject {
}

protocol LoginRouterInput: AnyObject {
    func openRegistration()
}

protocol RegistrationViewInput: AnyObject {
}

protocol RegistrationViewOutput: AnyObject {
    func didTapRegButton()
}
