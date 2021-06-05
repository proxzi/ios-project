//
//  ExploreProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import FirebaseDatabase

protocol ExploreModuleInput {
	var moduleOutput: ExploreModuleOutput? { get }
}

protocol ExploreModuleOutput: class {
}

protocol ExploreViewInput: class {
    func loadedListTrips(trips: Array<Trip>)
}

protocol ExploreViewOutput: class {
    func didSelectItemCollection(with trip: Trip)
    func didTapAddTravelButton()
    func didLoadTravels()
}

protocol ExploreInteractorInput: class {
    func loadListPlaces(ref: FirebaseDatabase.DatabaseReference)
    func updateListTravels()
}

protocol ExploreInteractorOutput: class {
    func loadedListTrips(trips: Array<Trip>)
    func loadedPlaces(places: Array<Place>)
}

protocol ExploreRouterInput: class {
    func openTravelDetail(with trip: Trip, and places: Array<Place>)
    func openAddTravel()
}
