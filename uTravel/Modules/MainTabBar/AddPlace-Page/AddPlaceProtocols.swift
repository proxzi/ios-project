//
//  AddPlaceProtocols.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

protocol AddPlaceModuleInput {
	var moduleOutput: AddPlaceModuleOutput? { get }
}

protocol AddPlaceModuleOutput: class {
}

protocol AddPlaceViewInput: class {
    func downloadHeadImage(image: UIImage?)
    func didSuccessfulSaveData()
}

protocol AddPlaceViewOutput: class {
    func didTapHeadImageView()
    func didTapDoneBarButton(place: Place)
}

protocol AddPlaceInteractorInput: class {
    func saveTrip(place: Place)
}

protocol AddPlaceInteractorOutput: class {
    func didSuccessfulSaveData()
}

protocol AddPlaceRouterInput: class {
    func showImagePicker(output: ImagePickerOutput)
}
