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
}

extension LoginRouter: LoginRouterInput {
    func openMain() {
        let container = MainContainer.assemble(with: MainContext())
        Coordinator.rootVC(vc: container.tabBarController)
    }
    
    func openRegistration() {
        let container = RegistrationContainer.assemble(with: RegistrationContext())
        self.logViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
