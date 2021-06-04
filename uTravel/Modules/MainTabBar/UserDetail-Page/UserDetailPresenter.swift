//
//  UserDetailPresenter.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

final class UserDetailPresenter {
	weak var view: UserDetailViewInput?
    weak var moduleOutput: UserDetailModuleOutput?

	private let router: UserDetailRouterInput
	private let interactor: UserDetailInteractorInput

    init(router: UserDetailRouterInput, interactor: UserDetailInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension UserDetailPresenter: UserDetailModuleInput {
}

extension UserDetailPresenter: UserDetailViewOutput {
}

extension UserDetailPresenter: UserDetailInteractorOutput {
}
