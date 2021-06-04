//
//  AnotherProfileProtocols.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

protocol AnotherProfileModuleInput {
	var moduleOutput: AnotherProfileModuleOutput? { get }
}

protocol AnotherProfileModuleOutput: class {
}

protocol AnotherProfileViewInput: class {
}

protocol AnotherProfileViewOutput: class {
}

protocol AnotherProfileInteractorInput: class {
}

protocol AnotherProfileInteractorOutput: class {
}

protocol AnotherProfileRouterInput: class {
}
