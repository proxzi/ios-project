//
//  NotificationContainer.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

final class NotificationContainer {
    let input: NotificationModuleInput
	let viewController: UIViewController
	private(set) weak var router: NotificationRouterInput!

	class func assemble(with context: NotificationContext) -> NotificationContainer {
        let router = NotificationRouter()
        let interactor = NotificationInteractor()
        let presenter = NotificationPresenter(router: router, interactor: interactor)
		let viewController = NotificationViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return NotificationContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: NotificationModuleInput, router: NotificationRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct NotificationContext {
	weak var moduleOutput: NotificationModuleOutput?
}
