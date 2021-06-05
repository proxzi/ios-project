//
//  AnotherProfilePresenter.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

final class AnotherProfilePresenter {
	weak var view: AnotherProfileViewInput?
    weak var moduleOutput: AnotherProfileModuleOutput?

	private let router: AnotherProfileRouterInput
	private let interactor: AnotherProfileInteractorInput
    private var trip: Trip?

    init(router: AnotherProfileRouterInput, interactor: AnotherProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherProfilePresenter: AnotherProfileModuleInput {
}

extension AnotherProfilePresenter: AnotherProfileViewOutput {
    func updateTrips(user: UserData) {
        interactor.updateListTrips(user: user)
    }
    
    func didSelectItemCollection(trip: Trip) {
        self.trip = trip
        interactor.loadListPlaces(ref: trip.ref!)
    }
    
    
}

extension AnotherProfilePresenter: AnotherProfileInteractorOutput {
    func loadedListTrips(trips: Array<Trip>) {
        view?.loadedTrips(trips: trips)
    }
    
    func loadedPlaces(places: Array<Place>) {
        router.openTravelDetail(trip: self.trip!, places: places)
    }
}
