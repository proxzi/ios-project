//
//  ProfileProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import FirebaseDatabase

protocol ProfileModuleInput {
	var moduleOutput: ProfileModuleOutput? { get }
}

protocol ProfileModuleOutput: class {
}

protocol ProfileViewInput: class {
    func loadedListTrips(trips: Array<Trip>)
    func reloadData(trip: Trip, index: Int)
    func reloadUserData(user: UserData)
}

protocol ProfileViewOutput: class {
    func didTapSettingsButton()
    func didSelectItemCollection(trip: Trip)
    func didLoadTravels()
    func didLoadUserData()
    func didRemoveObserves()
}

protocol ProfileInteractorInput: class {
    func updateListTravels()
    func updateUserData()
    func removeObserves()
    func loadListPlaces(ref: FirebaseDatabase.DatabaseReference)
}

protocol ProfileInteractorOutput: class {
    func loadedListTrips(trips: Array<Trip>)
    func reloadData(trip: Trip, index: Int)
    func loadedUserData(user: UserData)
    func loadedPlaces(places: Array<Place>)
}

protocol ProfileRouterInput: class {
    func openProfileSettings()
    func openTravelDetail(with trip: Trip, and places: Array<Place>)
}
