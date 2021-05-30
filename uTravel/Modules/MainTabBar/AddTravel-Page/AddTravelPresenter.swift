//
//  AddTravelPresenter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class AddTravelPresenter {
	weak var view: AddTravelViewInput?
    weak var moduleOutput: AddTravelModuleOutput?

	private let router: AddTravelRouterInput
	private let interactor: AddTravelInteractorInput

    init(router: AddTravelRouterInput, interactor: AddTravelInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AddTravelPresenter: AddTravelModuleInput {
}

extension AddTravelPresenter: AddTravelViewOutput {
    func didTapLocationLabel() {
        router.openLocationPage()
    }
    
    func didTapHeadImageView() {
        router.showImagePicker(output: self)
    }
    
    func didSelectItemCollection(index: Int) {
        if index == 0 {
            router.openAddPlace()
        }
    }
    
    func didTapDoneBarButton(travels: Travel) {
        interactor.saveTravel()
    }
    
}

extension AddTravelPresenter: AddTravelInteractorOutput {
    func didReceive(error: Error) {
        // show error
    }
    
    func didReceiveImage(toString: String) {
        
    }
}

extension AddTravelPresenter: ImagePickerOutput {
    func didSelect(image: UIImage?) {
        view?.downloadHeadImage(image: image)
    }
}
