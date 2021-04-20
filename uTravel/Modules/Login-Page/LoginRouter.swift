//
//  LoginRouter.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import UIKit

final class LoginRouter {
    weak var viewController: UIViewController?
}

extension LoginRouter: LoginRouterInput {
    func openRegistration() {
        let viewController = RegistrationViewController()
        viewController.view.backgroundColor = .yellow

        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
}
