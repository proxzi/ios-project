//
//  ExploreContainer.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ExploreContainer {
    let input: ExploreModuleInput
	let viewController: UIViewController
	private(set) weak var router: ExploreRouterInput!

	class func assemble(with context: ExploreContext) -> ExploreContainer {
        let router = ExploreRouter()
        let interactor = ExploreInteractor()
        let presenter = ExplorePresenter(router: router, interactor: interactor)
		let viewController = ExploreViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.viewController = viewController
        return ExploreContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ExploreModuleInput, router: ExploreRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ExploreContext {
	weak var moduleOutput: ExploreModuleOutput?
}
