//
//  LoginPresenter.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import Foundation

final class LoginPresenter {
	weak var logView: LoginViewInput?
    weak var regView: RegistrationViewInput?
    weak var moduleOutput: LoginModuleOutput?
	private let router: LoginRouterInput
	private let interactor: LoginInteractorInput

    init(router: LoginRouterInput, interactor: LoginInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension LoginPresenter: LoginModuleInput {
}

extension LoginPresenter: LoginViewOutput{

    
    func didTapLoginButton(email: String, password: String) {
        interactor.auth(withEmail: email, password: password)
        print("login")
    }
    
    func didTapRegistrationLabel() {
        router.openRegistration()
    }
    
}

extension LoginPresenter: LoginInteractorOutput {
}

extension LoginPresenter: RegistrationViewOutput{
    func didTapRegButton(email: String, password: String) {
        interactor.createUser(withEmail: email, password: password)
        print("registration")
    }

}
