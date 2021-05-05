//
//  NotificationProtocols.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation

protocol NotificationModuleInput {
	var moduleOutput: NotificationModuleOutput? { get }
}

protocol NotificationModuleOutput: class {
}

protocol NotificationViewInput: class {
}

protocol NotificationViewOutput: class {
}

protocol NotificationInteractorInput: class {
}

protocol NotificationInteractorOutput: class {
}

protocol NotificationRouterInput: class {
}
