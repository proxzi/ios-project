//
//  SearchUsersRouter.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class SearchUsersRouter {
    weak var viewController: UIViewController?
}

extension SearchUsersRouter: SearchUsersRouterInput {
    func openAnotherProfile(user: UserData) {
        let container = AnotherProfileContainer.assemble(with: AnotherProfileContext(), user: user)
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
