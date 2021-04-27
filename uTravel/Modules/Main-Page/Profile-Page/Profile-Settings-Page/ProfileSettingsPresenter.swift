//
//  ProfileSettingsPresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class ProfileSettingsPresenter {
	weak var view: ProfileSettingsViewInput?
    weak var moduleOutput: ProfileSettingsModuleOutput?

	private let router: ProfileSettingsRouterInput
	private let interactor: ProfileSettingsInteractorInput

    init(router: ProfileSettingsRouterInput, interactor: ProfileSettingsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProfileSettingsPresenter: ProfileSettingsModuleInput {
}

extension ProfileSettingsPresenter: ProfileSettingsViewOutput {
    func didTapLogOutButton() {
        interactor.didTapLogOutButton()
    }
    
}

extension ProfileSettingsPresenter: ProfileSettingsInteractorOutput {
    func successfulLogOut() {
        router.openLogin()
    }
    
}
