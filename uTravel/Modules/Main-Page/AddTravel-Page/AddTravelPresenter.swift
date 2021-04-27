//
//  AddTravelPresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class AddTravelPresenter {
	weak var view: AddTravelViewInput?
    weak var moduleOutput: AddTravelModuleOutput?

	private let router: AddTravelRouterInput
	private let interactor: AddTravelInteractorInput

    init(router: AddTravelRouterInput, interactor: AddTravelInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AddTravelPresenter: AddTravelModuleInput {
}

extension AddTravelPresenter: AddTravelViewOutput {
}

extension AddTravelPresenter: AddTravelInteractorOutput {
}
