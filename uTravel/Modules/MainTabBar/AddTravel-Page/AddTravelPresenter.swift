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
    func didSelectItemCollection(index: Int) {
        router.openAddPlace(index: index)
    }
    
    func didSelectItemCollection(place: Place, index: Int) {
        router.openEditPlace(place: place)
    }
    
    func didloadPlaces() {
        interactor.loadPlaces()
    }
    
    
    func didTapLocationLabel(location: String) {
        router.openLocationPage(location: location)
    }
    
    func didTapHeadImageView() {
        router.showImagePicker(output: self)
    }
    

    
    func didTapDoneBarButton(trip: Trip, places: Array<Place>) {
        interactor.saveTrip(trip: trip, places: places)
        
    }
    
}

extension AddTravelPresenter: AddTravelInteractorOutput {
    func reloadData(place: Place, index: Int) {
        view?.reloadData(place: place, index: index)
    }
    
    func loadedPlaces(places: Array<Place>) {
        view?.loadedPlaces(places: places)
    }
    
    func didSuccessfulSaveData() {
        view?.didSuccessfulSaveData()
    }
    
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
