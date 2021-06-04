//
//  ExplorePresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class ExplorePresenter {
	weak var view: ExploreViewInput?
    weak var moduleOutput: ExploreModuleOutput?

	private let router: ExploreRouterInput
	private let interactor: ExploreInteractorInput
    private var trip: Trip?

    init(router: ExploreRouterInput, interactor: ExploreInteractorInput) {
        self.router = router
        self.interactor = interactor
        self.trip = nil
    }
}

extension ExplorePresenter: ExploreModuleInput {
}

extension ExplorePresenter: ExploreViewOutput {

    func didLoadTravels() {
        interactor.updateListTravels()
    }
    
    func didTapAddTravelButton() {
        router.openAddTravel()
    }
    
    func didSelectItemCollection(with trip: Trip) {
        self.trip = trip
        interactor.loadListPlaces(ref: trip.ref!)
        //router.openTravelDetail(with: trip, and: [Place]())
    }
    
    
}

extension ExplorePresenter: ExploreInteractorOutput {
    func loadedListTrips(trips: Array<Trip>) {
        view?.loadedListTrips(trips: trips)
    }
    
}
