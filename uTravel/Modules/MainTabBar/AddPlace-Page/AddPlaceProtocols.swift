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
}

protocol AddPlaceViewOutput: class {
    func didTapHeadImageView()
}

protocol AddPlaceInteractorInput: class {
}

protocol AddPlaceInteractorOutput: class {
}

protocol AddPlaceRouterInput: class {
    func showImagePicker(output: ImagePickerOutput)
}
