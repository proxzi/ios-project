//
//  LocationContainer.swift
//  uTravel
//
//  Created by Dmitry on 28.05.2021.
//  
//

import UIKit

final class LocationContainer {
    let input: LocationModuleInput
	let viewController: UIViewController
	private(set) weak var router: LocationRouterInput!

	class func assemble(with context: LocationContext) -> LocationContainer {
        let router = LocationRouter()
        let interactor = LocationInteractor()
        let presenter = LocationPresenter(router: router, interactor: interactor)
		let viewController = LocationViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return LocationContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: LocationModuleInput, router: LocationRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct LocationContext {
	weak var moduleOutput: LocationModuleOutput?
}
