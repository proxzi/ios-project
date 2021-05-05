//
//  NotificationInteractor.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation

final class NotificationInteractor {
	weak var output: NotificationInteractorOutput?
}

extension NotificationInteractor: NotificationInteractorInput {
}
