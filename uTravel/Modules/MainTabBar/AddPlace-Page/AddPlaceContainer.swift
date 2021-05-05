//
//  AddPlaceContainer.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

final class AddPlaceContainer {
    let input: AddPlaceModuleInput
	let viewController: UIViewController
	private(set) weak var router: AddPlaceRouterInput!

	class func assemble(with context: AddPlaceContext) -> AddPlaceContainer {
        let router = AddPlaceRouter()
        let interactor = AddPlaceInteractor()
        let presenter = AddPlacePresenter(router: router, interactor: interactor)
		let viewController = AddPlaceViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.viewController = viewController

        return AddPlaceContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AddPlaceModuleInput, router: AddPlaceRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AddPlaceContext {
	weak var moduleOutput: AddPlaceModuleOutput?
}
