//
//  TravelDetailProtocols.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import Foundation

protocol TravelDetailModuleInput {
	var moduleOutput: TravelDetailModuleOutput? { get }
}

protocol TravelDetailModuleOutput: class {
}

protocol TravelDetailViewInput: class {
}

protocol TravelDetailViewOutput: class {
}

protocol TravelDetailInteractorInput: class {
}

protocol TravelDetailInteractorOutput: class {
}

protocol TravelDetailRouterInput: class {
}
