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

protocol MainViewInput: class {
}

protocol MainViewOutput: class {
}

protocol MainInteractorInput: class {
}

protocol MainInteractorOutput: class {
}

protocol MainRouterInput: class {
}
