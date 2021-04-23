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

extension LoginPresenter: LoginViewOutput {
    func didTapLoginButton() {
        print("login")
    }
    
    func didTapRegistrationLabel() {
        router.openRegistration()
    }
    
}

extension LoginPresenter: LoginInteractorOutput {
}

extension LoginPresenter: RegistrationViewOutput{
    func didTapRegButton(){
        print("registration")
    }
}
