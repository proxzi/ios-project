//
//  RegistrationContainer.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class RegistrationContainer {
    let input: RegistrationModuleInput
	let viewController: UIViewController
	private(set) weak var router: RegistrationRouterInput!

	class func assemble(with context: RegistrationContext) -> RegistrationContainer {
        let router = RegistrationRouter()
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter(router: router, interactor: interactor)
		let viewController = RegistrationViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return RegistrationContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: RegistrationModuleInput, router: RegistrationRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct RegistrationContext {
	weak var moduleOutput: RegistrationModuleOutput?
}
