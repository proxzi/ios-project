//
//  AddTravelInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import Firebase
import FirebaseDatabase

final class AddTravelInteractor {
	weak var output: AddTravelInteractorOutput?
    
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    
    private var imageString: String?
    private var trip: Trip!
    private var places = Array<Place>()
    private var user: User!
    private var ref: DatabaseReference!
    private var trips = Array<Trip>()
    private var tripId: Int!
    private var countPlaces = 0
}

extension AddTravelInteractor: AddTravelInteractorInput {
    func loadPlaces() {
//        guard let currentUser = Auth.auth().currentUser else { return }
//        user = User(user: currentUser)
//        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tmpPlaces")
//        var count = 0
//        ref.observe(.value, with: { [weak self] (snapshot) in
//            var _places = Array<Place>()
//            for item in snapshot.children {
//                var place = Place(snapshot: item as! Firebase.DataSnapshot)
//
//                self?.imageLoader.image(with: place.imageString, completion: { (result) in
//                    switch result {
//                    case .success(let image):
//                        place.image = image
//                        self?.output?.reloadData(place: place, index: count)
//                        count += 1
//                    case .failure(let error):
//                        print(error)
//                    }
//
//                })
//                _places.append(place)
//            }
//            self?.output?.loadedPlaces(places: _places)
//        })
    }
    
    func saveTrip(trip: Trip, places: Array<Place>) {
        self.trip = trip
        self.places = places
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("trips").child(trip.title.lowercased())
        imageUpload(image: trip.image, title: "myimage")
        
    }
    
    func updateJSON(trip: Trip) {
        ref.setValue(trip.convertToDictionary())
    }
    
    func updateJSON(place: Place) {
        countPlaces += 1
        
        var placeRef = ref.child("places")
        placeRef = placeRef.child(String(place.id))
        placeRef.setValue(place.convertToDictionary())

        if countPlaces == self.places.count{
            output?.didSuccessfulSaveData()
        }
    }
    
    
    func imageUpload(image: UIImage, title: String){
        imageLoader.upload(image: image) { [weak self] (result) in
            switch result {
            case .success(let name):
                self?.output?.didReceiveImage(toString: name)
                self?.trip.imageString = name
                self?.updateJSON(trip: (self?.trip)!)
                for i in 0...((self?.places.count)! - 1) {
                    self?.imageUpload(image: (self?.places[i].image!)! ,title: "myimage", index: i )
                }
            case .failure(let error):
                self?.output?.didReceive(error: error)
            }
        }
    }
        
    func imageUpload(image: UIImage, title: String, index: Int){
        imageLoader.upload(image: image) { [weak self] (result) in
            switch result {
            case .success(let name):
                self?.output?.didReceiveImage(toString: name)
                self?.places[index].imageString = name
                self?.updateJSON(place: (self?.places[index])!)
            case .failure(let error):
                self?.output?.didReceive(error: error)
            }
        }
    }
}
