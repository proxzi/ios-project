//
//  ProfilePresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class ProfilePresenter {
	weak var view: ProfileViewInput?
    weak var moduleOutput: ProfileModuleOutput?

	private let router: ProfileRouterInput
	private let interactor: ProfileInteractorInput

    init(router: ProfileRouterInput, interactor: ProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProfilePresenter: ProfileModuleInput {
}

extension ProfilePresenter: ProfileViewOutput {
    func didTapSettingsButton() {
        router.openProfileSettings()
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
}
