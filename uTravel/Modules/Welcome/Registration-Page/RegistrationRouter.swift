//
//  RegistrationRouter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class RegistrationRouter {
}

extension RegistrationRouter: RegistrationRouterInput {
    func openMain() {
        let container = MainContainer.assemble(with: MainContext())
        Coordinator.rootVC(vc: container.tabBarController)
    }
}
