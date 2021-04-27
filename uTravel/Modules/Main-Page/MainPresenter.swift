//
//  MainPresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

final class MainPresenter {
	weak var view: MainTabBarControllerInput?
    weak var moduleOutput: MainModuleOutput?

	private let router: MainRouterInput
	private let interactor: MainInteractorInput

    init(router: MainRouterInput, interactor: MainInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainPresenter: MainModuleInput {
}

extension MainPresenter: MainTabBarControllerOutput {
}

extension MainPresenter: MainInteractorOutput {
}
