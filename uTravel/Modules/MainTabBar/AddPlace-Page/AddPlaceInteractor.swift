//
//  AddPlaceInteractor.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

final class AddPlaceInteractor {
	weak var output: AddPlaceInteractorOutput?
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    private var place: Place!
    private var ref: DatabaseReference!
    private var placeId: Int!
    private var id_count = 0
    private var user: User!
}

extension AddPlaceInteractor: AddPlaceInteractorInput {
    
    func saveTrip(place: Place) {
//        imageUpload(with: place.image!, title: "myimage")
//        self.place = place
    }
    
    func updateJSON(place: Place) {
//        guard let currentUser = Auth.auth().currentUser else { return }
//        user = User(user: currentUser)
//        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tmpPlaces")
//
//        var tmpPlace = place
//        tmpPlace.id = self.id_count
//        let tripRef = ref.child(String(tmpPlace.id))
//        tripRef.setValue(tmpPlace.convertToDictionary())
//        self.id_count += 1
//        output?.didSuccessfulSaveData()
    }
    
    
    func imageUpload(with image: UIImage, title: String){
//        imageLoader.upload(image: image) { [weak self] (result) in
//            switch result {
//            case .success(let name):
//                //self?.output?.didReceiveImage(toString: name)
//                self?.place.imageString = name
//                self?.updateJSON(place: (self?.place)!)
//            case .failure(let error):
//                print("\(error)")
//                //self?.output?.didReceive(error: error)
//            }
//        }
    }
}
