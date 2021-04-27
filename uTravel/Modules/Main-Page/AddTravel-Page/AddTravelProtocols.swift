//
//  AddTravelProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

protocol AddTravelModuleInput {
	var moduleOutput: AddTravelModuleOutput? { get }
}

protocol AddTravelModuleOutput: class {
}

protocol AddTravelViewInput: class {
}

protocol AddTravelViewOutput: class {
}

protocol AddTravelInteractorInput: class {
}

protocol AddTravelInteractorOutput: class {
}

protocol AddTravelRouterInput: class {
}
