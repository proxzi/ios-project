//
//  LoginRouter.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import UIKit

final class LoginRouter {
    weak var logViewController: UIViewController?
    weak var output: RegistrationViewOutput?
}

extension LoginRouter: LoginRouterInput {
    func openRegistration() {
        let regViewController = RegistrationViewController(output: self.output!)
        self.logViewController?.navigationController?.pushViewController(regViewController, animated: true)
    }
}
