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

    init(router: ExploreRouterInput, interactor: ExploreInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ExplorePresenter: ExploreModuleInput {
}

extension ExplorePresenter: ExploreViewOutput {
    func didTapAddTravelButton() {
        
    }
    
    func didSelectItemCollection() {
        router.openTravelDetail()
    }
    
    
}

extension ExplorePresenter: ExploreInteractorOutput {
}
