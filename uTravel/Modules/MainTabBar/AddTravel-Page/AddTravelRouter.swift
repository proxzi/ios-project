//
//  AddTravelRouter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class AddTravelRouter {
    private let imagePicker = ImagePicker()
    
    weak var viewController: UIViewController?
}

extension AddTravelRouter: AddTravelRouterInput {
    func openLocationPage() {
        let container = LocationContainer.assemble(with: LocationContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openAddPlace() {
        let container = AddPlaceContainer.assemble(with: AddPlaceContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    func showImagePicker(output: ImagePickerOutput) {
        imagePicker.output = output
        imagePicker.start(in: viewController)
    }
}
