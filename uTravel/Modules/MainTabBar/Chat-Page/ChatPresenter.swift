//
//  ChatPresenter.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation

final class ChatPresenter {
	weak var view: ChatViewInput?
    weak var moduleOutput: ChatModuleOutput?

	private let router: ChatRouterInput
	private let interactor: ChatInteractorInput

    init(router: ChatRouterInput, interactor: ChatInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ChatPresenter: ChatModuleInput {
}

extension ChatPresenter: ChatViewOutput {
}

extension ChatPresenter: ChatInteractorOutput {
}
