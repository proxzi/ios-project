//
//  ProfileSettingsProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

protocol ProfileSettingsModuleInput {
	var moduleOutput: ProfileSettingsModuleOutput? { get }
}

protocol ProfileSettingsModuleOutput: class {
}

protocol ProfileSettingsViewInput: class {
}

protocol ProfileSettingsViewOutput: class {
    func didTapLogOutButton()
}

protocol ProfileSettingsInteractorInput: class {
    func didTapLogOutButton()
}

protocol ProfileSettingsInteractorOutput: class {
    func successfulLogOut()
}

protocol ProfileSettingsRouterInput: class {
    func openLogin()
}
