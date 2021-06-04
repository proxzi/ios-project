//
//  UserDetailContainer.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class UserDetailContainer {
    let input: UserDetailModuleInput
	let viewController: UIViewController
	private(set) weak var router: UserDetailRouterInput!

	class func assemble(with context: UserDetailContext) -> UserDetailContainer {
        let router = UserDetailRouter()
        let interactor = UserDetailInteractor()
        let presenter = UserDetailPresenter(router: router, interactor: interactor)
		let viewController = UserDetailViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return UserDetailContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: UserDetailModuleInput, router: UserDetailRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct UserDetailContext {
	weak var moduleOutput: UserDetailModuleOutput?
}
