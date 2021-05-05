//
//  ChatProtocols.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation

protocol ChatModuleInput {
	var moduleOutput: ChatModuleOutput? { get }
}

protocol ChatModuleOutput: class {
}

protocol ChatViewInput: class {
}

protocol ChatViewOutput: class {
}

protocol ChatInteractorInput: class {
}

protocol ChatInteractorOutput: class {
}

protocol ChatRouterInput: class {
}
