//
//  ExploreProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation

protocol ExploreModuleInput {
	var moduleOutput: ExploreModuleOutput? { get }
}

protocol ExploreModuleOutput: class {
}

protocol ExploreViewInput: class {
}

protocol ExploreViewOutput: class {
    func didSelectItemCollection()
    func didTapAddTravelButton()
}

protocol ExploreInteractorInput: class {
}

protocol ExploreInteractorOutput: class {
}

protocol ExploreRouterInput: class {
    func openTravelDetail()
    func openAddTravel()
}
