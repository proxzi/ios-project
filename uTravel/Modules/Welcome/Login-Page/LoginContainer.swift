//
//  LoginContainer.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import UIKit

final class LoginContainer {
    let input: LoginModuleInput
	let logViewController: UIViewController
	private(set) weak var router: LoginRouterInput!

	class func assemble(with context: LoginContext) -> LoginContainer {
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(router: router, interactor: interactor)
		let logViewController = LoginViewController(output: presenter)

		presenter.logView = logViewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.logViewController = logViewController

        return LoginContainer(logView: logViewController, input: presenter, router: router)
	}

    private init(logView: UIViewController, input: LoginModuleInput, router: LoginRouterInput) {
		self.logViewController = logView
        self.input = input
		self.router = router
	}
}

struct LoginContext {
	weak var moduleOutput: LoginModuleOutput?
}
