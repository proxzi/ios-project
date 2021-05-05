//
//  AddPlaceRouter.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

final class AddPlaceRouter {
    private let imagePicker = ImagePicker()
    
    weak var viewController: UIViewController?
}

extension AddPlaceRouter: AddPlaceRouterInput {
    
    func showImagePicker(output: ImagePickerOutput) {
        imagePicker.output = output
        imagePicker.start(in: viewController)
    }
}
