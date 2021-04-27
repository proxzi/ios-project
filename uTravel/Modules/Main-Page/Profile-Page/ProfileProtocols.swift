//
//  ProfileProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

protocol ProfileModuleInput {
	var moduleOutput: ProfileModuleOutput? { get }
}

protocol ProfileModuleOutput: class {
}

protocol ProfileViewInput: class {
}

protocol ProfileViewOutput: class {
    func didTapSettingsButton()
}

protocol ProfileInteractorInput: class {
}

protocol ProfileInteractorOutput: class {
}

protocol ProfileRouterInput: class {
    func openProfileSettings()
}
