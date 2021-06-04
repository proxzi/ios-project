//
//  SearchUsersProtocols.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation

protocol SearchUsersModuleInput {
	var moduleOutput: SearchUsersModuleOutput? { get }
}

protocol SearchUsersModuleOutput: class {
}

protocol SearchUsersViewInput: class {
    func updateUserList(users: Array<UserData>)
}

protocol SearchUsersViewOutput: class {
    func didLoadUserList()
}

protocol SearchUsersInteractorInput: class {
    func updateUserList()
}

protocol SearchUsersInteractorOutput: class {
    func loadedUserList(users: Array<UserData>)
}

protocol SearchUsersRouterInput: class {
}
