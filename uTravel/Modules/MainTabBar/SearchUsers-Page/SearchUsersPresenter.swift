//
//  SearchUsersPresenter.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

final class SearchUsersPresenter {
	weak var view: SearchUsersViewInput?
    weak var moduleOutput: SearchUsersModuleOutput?

	private let router: SearchUsersRouterInput
	private let interactor: SearchUsersInteractorInput

    init(router: SearchUsersRouterInput, interactor: SearchUsersInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SearchUsersPresenter: SearchUsersModuleInput {
}

extension SearchUsersPresenter: SearchUsersViewOutput {
    func didLoadUserList() {
        interactor.updateUserList()
    }
    func didSelectItemCollection(user: UserData) {
        router.openAnotherProfile(user: user)
    }
    
}

extension SearchUsersPresenter: SearchUsersInteractorOutput {
    func loadedUserList(users: Array<UserData>) {
        view?.updateUserList(users: users)
    }
    
}
