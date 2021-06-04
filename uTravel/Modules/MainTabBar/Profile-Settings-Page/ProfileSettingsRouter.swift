//
//  ProfileSettingsRouter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ProfileSettingsRouter {
   
}

extension ProfileSettingsRouter: ProfileSettingsRouterInput {
    func openLogin() {
        let container = LoginContainer.assemble(with: LoginContext())
        Coordinator.rootVC(vc: UINavigationController(rootViewController: container.logViewController))
    }
}
