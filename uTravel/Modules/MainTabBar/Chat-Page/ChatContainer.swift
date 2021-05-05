//
//  ChatContainer.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

final class ChatContainer {
    let input: ChatModuleInput
	let viewController: UIViewController
	private(set) weak var router: ChatRouterInput!

	class func assemble(with context: ChatContext) -> ChatContainer {
        let router = ChatRouter()
        let interactor = ChatInteractor()
        let presenter = ChatPresenter(router: router, interactor: interactor)
		let viewController = ChatViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return ChatContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ChatModuleInput, router: ChatRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ChatContext {
	weak var moduleOutput: ChatModuleOutput?
}
