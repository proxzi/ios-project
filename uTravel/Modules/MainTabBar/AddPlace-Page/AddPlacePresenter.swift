//
//  AddPlacePresenter.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

final class AddPlacePresenter {
	weak var view: AddPlaceViewInput?
    weak var moduleOutput: AddPlaceModuleOutput?

	private let router: AddPlaceRouterInput
	private let interactor: AddPlaceInteractorInput

    init(router: AddPlaceRouterInput, interactor: AddPlaceInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AddPlacePresenter: AddPlaceModuleInput {
}

extension AddPlacePresenter: AddPlaceViewOutput {
    func didTapHeadImageView() {
        router.showImagePicker(output: self)
    }
}

extension AddPlacePresenter: AddPlaceInteractorOutput {
}

extension AddPlacePresenter: ImagePickerOutput {
    func didSelect(image: UIImage?) {
        view?.downloadHeadImage(image: image)
    }
}
