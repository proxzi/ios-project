//
//  SearchUsersContainer.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class SearchUsersContainer {
    let input: SearchUsersModuleInput
	let viewController: UIViewController
	private(set) weak var router: SearchUsersRouterInput!

	class func assemble(with context: SearchUsersContext) -> SearchUsersContainer {
        let router = SearchUsersRouter()
        let interactor = SearchUsersInteractor()
        let presenter = SearchUsersPresenter(router: router, interactor: interactor)
		let viewController = SearchUsersViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.viewController  = viewController
        

        return SearchUsersContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: SearchUsersModuleInput, router: SearchUsersRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct SearchUsersContext {
	weak var moduleOutput: SearchUsersModuleOutput?
}
