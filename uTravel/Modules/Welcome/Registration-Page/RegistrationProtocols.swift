//
//  RegistrationProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

protocol RegistrationModuleInput {
	var moduleOutput: RegistrationModuleOutput? { get }
}

protocol RegistrationModuleOutput: class {
}

protocol RegistrationViewInput: class {
}

protocol RegistrationViewOutput: class {
    func didTapRegButton(user: UserData, password: String)
}

protocol RegistrationInteractorInput: class {
    
    func createUser(user: UserData, password: String)
}

protocol RegistrationInteractorOutput: class {
    func successfulRegistration()
}

protocol RegistrationRouterInput: class {
    func openMain()
}
