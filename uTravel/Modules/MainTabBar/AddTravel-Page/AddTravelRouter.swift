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
    func openAddPlace(index: Int) {
        AddPlaceViewController.idPlace = index
        let container = AddPlaceContainer.assemble(with: AddPlaceContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openEditPlace(place: Place) {
        AddPlaceViewController.place = place
        let container = AddPlaceContainer.assemble(with: AddPlaceContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openLocationPage(location: String) {
        LocationViewController.textlocation = location
        let container = LocationContainer.assemble(with: LocationContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
        
    }
    
    func showImagePicker(output: ImagePickerOutput) {
        imagePicker.output = output
        imagePicker.start(in: viewController)
    }
}
