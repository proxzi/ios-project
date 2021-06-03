//
//  PlaceDetailProtocols.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

protocol PlaceDetailModuleInput {
	var moduleOutput: PlaceDetailModuleOutput? { get }
}

protocol PlaceDetailModuleOutput: class {
}

protocol PlaceDetailViewInput: class {
}

protocol PlaceDetailViewOutput: class {
}

protocol PlaceDetailInteractorInput: class {
}

protocol PlaceDetailInteractorOutput: class {
}

protocol PlaceDetailRouterInput: class {
}
