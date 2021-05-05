//
//  MainProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

protocol MainModuleInput {
	var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: class {
}

protocol MainTabBarControllerInput: class {
}

protocol MainTabBarControllerOutput: class {
}

protocol MainInteractorInput: class {
}

protocol MainInteractorOutput: class {
}

protocol MainRouterInput: class {
}
