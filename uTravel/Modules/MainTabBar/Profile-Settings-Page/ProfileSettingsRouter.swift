//
//  ProfileSettingsRouter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ProfileSettingsRouter {
    private let imagePicker = ImagePicker()
    weak var viewController: UIViewController?
}

extension ProfileSettingsRouter: ProfileSettingsRouterInput {
    func showImagePicker(output: ImagePickerOutput) {
        imagePicker.output = output
        imagePicker.start(in: viewController)
    }
    
    func openLogin() {
        let container = LoginContainer.assemble(with: LoginContext())
        Coordinator.rootVC(vc: UINavigationController(rootViewController: container.logViewController))
    }
}
