//
//  LocationPresenter.swift
//  uTravel
//
//  Created by Dmitry on 28.05.2021.
//  
//

import Foundation

final class LocationPresenter {
	weak var view: LocationViewInput?
    weak var moduleOutput: LocationModuleOutput?

	private let router: LocationRouterInput
	private let interactor: LocationInteractorInput

    init(router: LocationRouterInput, interactor: LocationInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension LocationPresenter: LocationModuleInput {
}

extension LocationPresenter: LocationViewOutput {
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        
    }
}

extension LocationPresenter: LocationInteractorOutput {
}
