//
//  NotificationPresenter.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation

final class NotificationPresenter {
	weak var view: NotificationViewInput?
    weak var moduleOutput: NotificationModuleOutput?

	private let router: NotificationRouterInput
	private let interactor: NotificationInteractorInput

    init(router: NotificationRouterInput, interactor: NotificationInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension NotificationPresenter: NotificationModuleInput {
}

extension NotificationPresenter: NotificationViewOutput {
}

extension NotificationPresenter: NotificationInteractorOutput {
}
