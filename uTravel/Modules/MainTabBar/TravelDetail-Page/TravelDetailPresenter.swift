//
//  TravelDetailPresenter.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import Foundation

final class TravelDetailPresenter {
	weak var view: TravelDetailViewInput?
    weak var moduleOutput: TravelDetailModuleOutput?

	private let router: TravelDetailRouterInput
	private let interactor: TravelDetailInteractorInput

    init(router: TravelDetailRouterInput, interactor: TravelDetailInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension TravelDetailPresenter: TravelDetailModuleInput {
}

extension TravelDetailPresenter: TravelDetailViewOutput {
    func didSelectItemCollection(place: Place) {
        router.openPlaceDetail(place: place)
    }
    
}

extension TravelDetailPresenter: TravelDetailInteractorOutput {
}
