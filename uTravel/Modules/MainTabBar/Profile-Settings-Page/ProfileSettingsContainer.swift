//
//  ProfileSettingsContainer.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ProfileSettingsContainer {
    let input: ProfileSettingsModuleInput
	let viewController: UIViewController
	private(set) weak var router: ProfileSettingsRouterInput!

    class func assemble(with context: ProfileSettingsContext, user: UserData) -> ProfileSettingsContainer {
        let router = ProfileSettingsRouter()
        let interactor = ProfileSettingsInteractor()
        let presenter = ProfileSettingsPresenter(router: router, interactor: interactor)
		let viewController = ProfileSettingsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        
        viewController.user = user
        router.viewController = viewController
		interactor.output = presenter

        return ProfileSettingsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ProfileSettingsModuleInput, router: ProfileSettingsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ProfileSettingsContext {
	weak var moduleOutput: ProfileSettingsModuleOutput?
}
