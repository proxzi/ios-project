//
//  AddTravelContainer.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class AddTravelContainer {
    let input: AddTravelModuleInput
	let viewController: UIViewController
	private(set) weak var router: AddTravelRouterInput!

	class func assemble(with context: AddTravelContext) -> AddTravelContainer {
        let router = AddTravelRouter()
        let interactor = AddTravelInteractor()
        let presenter = AddTravelPresenter(router: router, interactor: interactor)
		let viewController = AddTravelViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AddTravelContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AddTravelModuleInput, router: AddTravelRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AddTravelContext {
	weak var moduleOutput: AddTravelModuleOutput?
}
