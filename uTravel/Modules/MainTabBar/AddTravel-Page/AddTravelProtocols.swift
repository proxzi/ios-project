//
//  AddTravelProtocols.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

protocol AddTravelModuleInput {
	var moduleOutput: AddTravelModuleOutput? { get }
}

protocol AddTravelModuleOutput: class {
}

protocol AddTravelViewInput: class {
    func downloadHeadImage(image: UIImage?)
}

protocol AddTravelViewOutput: class {
    func didTapDoneBarButton(travels: Travel)
    func didSelectItemCollection(index: Int)
    func didTapHeadImageView()
}

protocol AddTravelInteractorInput: class {
    func saveTravel()
}

protocol AddTravelInteractorOutput: class {
    func didReceive(error: Error)
    func didReceiveImage(toString: String)
}

protocol AddTravelRouterInput: class {
    func openAddPlace()
    func showImagePicker(output: ImagePickerOutput)
}
