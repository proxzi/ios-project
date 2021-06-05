//
//  ProfilePresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class ProfilePresenter {
	weak var view: ProfileViewInput?
    weak var moduleOutput: ProfileModuleOutput?

	private let router: ProfileRouterInput
	private let interactor: ProfileInteractorInput

    private var trip: Trip?
    
    init(router: ProfileRouterInput, interactor: ProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
        self.trip = nil
    }
}

extension ProfilePresenter: ProfileModuleInput {
}

extension ProfilePresenter: ProfileViewOutput {
    func didRemoveObserves() {
        interactor.removeObserves()
    }
    
    func didLoadUserData() {
        interactor.updateUserData()
    }
    
    func didLoadTravels() {
        interactor.updateListTravels()
    }
    
    func didTapSettingsButton(user: UserData) {
        router.openProfileSettings(user: user)
    }
    
    func didSelectItemCollection(trip: Trip) {
        self.trip = trip
        interactor.loadListPlaces(ref: trip.ref!)
        
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
    func loadedPlaces(places: Array<Place>) {
        router.openTravelDetail(with: trip!, and: places)
    }
    
    func loadedUserData(user: UserData) {
        view?.reloadUserData(user: user)
    }
    
    func reloadData(trip: Trip, index: Int) {
        view?.reloadData(trip: trip, index: index)
    }
    
    func loadedListTrips(trips: Array<Trip>) {
        view?.loadedListTrips(trips: trips)
    }
    
}
