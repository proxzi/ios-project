//
//  AnotherProfileProtocols.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation
import FirebaseDatabase

protocol AnotherProfileModuleInput {
	var moduleOutput: AnotherProfileModuleOutput? { get }
}

protocol AnotherProfileModuleOutput: class {
}

protocol AnotherProfileViewInput: class {
    func loadedTrips(trips: Array<Trip>)
}

protocol AnotherProfileViewOutput: class {
    func didSelectItemCollection(trip: Trip)
    func updateTrips(user: UserData)
}

protocol AnotherProfileInteractorInput: class {
    func didloadTargetPlaces(trip: Trip)
    func updateListTrips(user:UserData)
    func loadListPlaces(ref: FirebaseDatabase.DatabaseReference)
}

protocol AnotherProfileInteractorOutput: class {
    func loadedPlaces(places: Array<Place>)
    func loadedListTrips(trips: Array<Trip>)
}

protocol AnotherProfileRouterInput: class {
    func openTravelDetail(trip: Trip, places: Array<Place>)
}
