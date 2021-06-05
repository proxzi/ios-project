//
//  ProfileSettingsPresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

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
    func didTapDoneBarButton(user: UserData) {
        interactor.saveData(user: user)
    }
    
    func didTapProfileImageView() {
        router.showImagePicker(output: self)
    }
    
    func didTapLogOutButton() {
        interactor.didTapLogOutButton()
    }
    
}

extension ProfileSettingsPresenter: ProfileSettingsInteractorOutput {
    func successfulSavedData() {
        view?.savedData()
    }
    
    func successfulLogOut() {
        router.openLogin()
    }
    
}

extension ProfileSettingsPresenter: ImagePickerOutput {
    func didSelect(image: UIImage?) {
        view?.downloadProfileImage(image: image)
    }
}
