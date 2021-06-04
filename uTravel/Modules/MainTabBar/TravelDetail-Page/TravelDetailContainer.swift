//
//  TravelDetailContainer.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import UIKit

final class TravelDetailContainer {
    let input: TravelDetailModuleInput
	let viewController: UIViewController
	private(set) weak var router: TravelDetailRouterInput!

    class func assemble(with context: TravelDetailContext, trip: Trip, places: Array<Place>) -> TravelDetailContainer {
        let router = TravelDetailRouter()
        let interactor = TravelDetailInteractor()
        let presenter = TravelDetailPresenter(router: router, interactor: interactor)
		let viewController = TravelDetailViewController(output: presenter)

        viewController.trip = trip
        viewController.places = places
        
		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.viewController = viewController
        
        
        return TravelDetailContainer(view: viewController, input: presenter, router: router)
	}
    
    private init(view: UIViewController, input: TravelDetailModuleInput, router: TravelDetailRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct TravelDetailContext {
	weak var moduleOutput: TravelDetailModuleOutput?
}
