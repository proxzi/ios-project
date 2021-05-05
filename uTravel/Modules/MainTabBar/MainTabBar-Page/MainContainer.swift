//
//  MainContainer.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class MainContainer {
    let input: MainModuleInput
	let tabBarController: UITabBarController
	private(set) weak var router: MainRouterInput!

	class func assemble(with context: MainContext) -> MainContainer {
        let router = MainRouter()
        let interactor = MainInteractor()
        let presenter = MainPresenter(router: router, interactor: interactor)
		let tabBarController = MainTabBarController(output: presenter)

		presenter.view = tabBarController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return MainContainer(tabBar: tabBarController, input: presenter, router: router)
	}

    private init(tabBar: UITabBarController, input: MainModuleInput, router: MainRouterInput) {
		self.tabBarController = tabBar
        self.input = input
		self.router = router
	}
}

struct MainContext {
	weak var moduleOutput: MainModuleOutput?
}
