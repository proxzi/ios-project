//
//  PlaceDetailContainer.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class PlaceDetailContainer {
    let input: PlaceDetailModuleInput
	let viewController: UIViewController
	private(set) weak var router: PlaceDetailRouterInput!

    class func assemble(with context: PlaceDetailContext, place: Place) -> PlaceDetailContainer {
        let router = PlaceDetailRouter()
        let interactor = PlaceDetailInteractor()
        let presenter = PlaceDetailPresenter(router: router, interactor: interactor)
		let viewController = PlaceDetailViewController(output: presenter)

        viewController.place = place
		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return PlaceDetailContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: PlaceDetailModuleInput, router: PlaceDetailRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct PlaceDetailContext {
	weak var moduleOutput: PlaceDetailModuleOutput?
}
