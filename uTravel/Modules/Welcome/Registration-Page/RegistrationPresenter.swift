//
//  RegistrationPresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class RegistrationPresenter {
	weak var view: RegistrationViewInput?
    weak var moduleOutput: RegistrationModuleOutput?

	private let router: RegistrationRouterInput
	private let interactor: RegistrationInteractorInput

    init(router: RegistrationRouterInput, interactor: RegistrationInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension RegistrationPresenter: RegistrationModuleInput {
}

extension RegistrationPresenter: RegistrationViewOutput {
    func didTapRegButton(email: String, password: String) {
        interactor.createUser(withEmail: email, password: password)
        print("registration")
    }
    
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    func successfulRegistration() {
        router.openMain()
    }
    
}
