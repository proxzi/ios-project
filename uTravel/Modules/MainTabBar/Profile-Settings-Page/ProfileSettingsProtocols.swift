//
//  ProfileSettingsProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

protocol ProfileSettingsModuleInput {
	var moduleOutput: ProfileSettingsModuleOutput? { get }
}

protocol ProfileSettingsModuleOutput: class {
}

protocol ProfileSettingsViewInput: class {
    func downloadProfileImage(image: UIImage?)
    func downloadBackgroundImage(image: UIImage?)
    func savedData()
}

protocol ProfileSettingsViewOutput: class {
    func didTapLogOutButton()
    func didTapProfileImageView()
    func didTapDoneBarButton(user: UserData)
}

protocol ProfileSettingsInteractorInput: class {
    func didTapLogOutButton()
    func saveData(user: UserData)
}

protocol ProfileSettingsInteractorOutput: class {
    func successfulLogOut()
    func successfulSavedData()
}

protocol ProfileSettingsRouterInput: class {
    func openLogin()
    func showImagePicker(output: ImagePickerOutput)
}
