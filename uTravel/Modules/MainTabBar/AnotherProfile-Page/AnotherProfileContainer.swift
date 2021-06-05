//
//  AnotherProfileContainer.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class AnotherProfileContainer {
    let input: AnotherProfileModuleInput
	let viewController: UIViewController
	private(set) weak var router: AnotherProfileRouterInput!

    class func assemble(with context: AnotherProfileContext, user: UserData) -> AnotherProfileContainer {
        let router = AnotherProfileRouter()
        let interactor = AnotherProfileInteractor()
        let presenter = AnotherProfilePresenter(router: router, interactor: interactor)
		let viewController = AnotherProfileViewController(output: presenter)

        viewController.user = user
		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.viewController = viewController
        return AnotherProfileContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AnotherProfileModuleInput, router: AnotherProfileRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AnotherProfileContext {
	weak var moduleOutput: AnotherProfileModuleOutput?
}
