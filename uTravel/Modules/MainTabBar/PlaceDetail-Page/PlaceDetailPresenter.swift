//
//  PlaceDetailPresenter.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

final class PlaceDetailPresenter {
	weak var view: PlaceDetailViewInput?
    weak var moduleOutput: PlaceDetailModuleOutput?

	private let router: PlaceDetailRouterInput
	private let interactor: PlaceDetailInteractorInput

    init(router: PlaceDetailRouterInput, interactor: PlaceDetailInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension PlaceDetailPresenter: PlaceDetailModuleInput {
}

extension PlaceDetailPresenter: PlaceDetailViewOutput {
}

extension PlaceDetailPresenter: PlaceDetailInteractorOutput {
}
