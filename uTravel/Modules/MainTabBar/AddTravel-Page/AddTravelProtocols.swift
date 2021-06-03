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
    func didSuccessfulSaveData()
    func loadedPlaces(places: Array<Place>)
    func reloadData(place: Place, index: Int)
}

protocol AddTravelViewOutput: class {
    func didTapDoneBarButton(trip: Trip, places: Array<Place>)
    func didSelectItemCollection(place: Place, index: Int)
    func didSelectItemCollection(index: Int)
    func didTapHeadImageView()
    func didTapLocationLabel(location: String)
    func didloadPlaces()
}

protocol AddTravelInteractorInput: class {
    func saveTrip(trip: Trip, places: Array<Place>)
    func loadPlaces()
}

protocol AddTravelInteractorOutput: class {
    func didReceive(error: Error)
    func didReceiveImage(toString: String)
    func didSuccessfulSaveData()
    func loadedPlaces(places: Array<Place>)
    func reloadData(place: Place, index: Int)
}

protocol AddTravelRouterInput: class {
    func openAddPlace(index: Int)
    func openEditPlace(place: Place)
    func openLocationPage(location: String)
    func showImagePicker(output: ImagePickerOutput)
}
