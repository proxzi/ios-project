//
//  UserDetailProtocols.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

protocol UserDetailModuleInput {
	var moduleOutput: UserDetailModuleOutput? { get }
}

protocol UserDetailModuleOutput: class {
}

protocol UserDetailViewInput: class {
}

protocol UserDetailViewOutput: class {
}

protocol UserDetailInteractorInput: class {
}

protocol UserDetailInteractorOutput: class {
}

protocol UserDetailRouterInput: class {
}
