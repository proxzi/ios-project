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

    init(router: AnotherProfileRouterInput, interactor: AnotherProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherProfilePresenter: AnotherProfileModuleInput {
}

extension AnotherProfilePresenter: AnotherProfileViewOutput {
    func didSelectItemCollection(trip: Trip) {
        
    }
    
    
}

extension AnotherProfilePresenter: AnotherProfileInteractorOutput {
    func loadedPlaces(places: Array<Place>) {
        
    }
}
