//
//  AnotherProfileProtocols.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

protocol AnotherProfileModuleInput {
	var moduleOutput: AnotherProfileModuleOutput? { get }
}

protocol AnotherProfileModuleOutput: class {
}

protocol AnotherProfileViewInput: class {
}

protocol AnotherProfileViewOutput: class {
    func didSelectItemCollection(trip: Trip)
}

protocol AnotherProfileInteractorInput: class {
    func didloadTargetPlaces(trip: Trip)
}

protocol AnotherProfileInteractorOutput: class {
    func loadedPlaces(places: Array<Place>)
}

protocol AnotherProfileRouterInput: class {
    func openTravelDetail(trip: Trip, places: Array<Place>)
}
