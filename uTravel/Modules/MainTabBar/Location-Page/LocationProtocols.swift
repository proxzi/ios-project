//
//  LocationProtocols.swift
//  uTravel
//
//  Created by Dmitry on 28.05.2021.
//  
//

import Foundation

protocol LocationModuleInput {
	var moduleOutput: LocationModuleOutput? { get }
}

protocol LocationModuleOutput: class {
}

protocol LocationViewInput: class {
}

protocol LocationViewOutput: class {
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String)
}

protocol LocationInteractorInput: class {
}

protocol LocationInteractorOutput: class {
}

protocol LocationRouterInput: class {
}
