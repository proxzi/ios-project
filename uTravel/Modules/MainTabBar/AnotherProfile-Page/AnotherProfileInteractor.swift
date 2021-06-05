//
//  AnotherProfileInteractor.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import Foundation
import Firebase
import FirebaseDatabase

final class AnotherProfileInteractor {
	weak var output: AnotherProfileInteractorOutput?
    
    private var user: UserData!
    private var ref: DatabaseReference!
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
}

extension AnotherProfileInteractor: AnotherProfileInteractorInput {
    
    func loadListPlaces(ref: DatabaseReference) {
        var places = Array<Place>()
        let placeRef = ref.child("places")
        placeRef.observe(.value, with: { [weak self] (snapshot) in
            places.removeAll()
            for item in snapshot.children {
                var place = Place(snapshot: item as! Firebase.DataSnapshot)
                self?.imageLoader.image(with: place.imageString, completion: { [weak self] (result) in
                    switch result {
                    case .success(let image):
                        place.image = image
                        places.append(place)
                        if places.count == Int(snapshot.childrenCount) {
                            self?.output?.loadedPlaces(places: places)
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
            }
        })
    }
    
    func updateListTrips(user: UserData) {
        self.user = user
        ref = user.ref?.child("trips")
        ref.observe(.value, with: { [weak self] (snapshot) in
            var _trips = Array<Trip>()
            for item in snapshot.children {
                var trip = Trip(snapshot: item as! Firebase.DataSnapshot)
                
                self?.imageLoader.image(with: trip.imageString, completion: { [weak self] (result) in
                    switch result {
                    case .success(let image):
                        trip.image = image
                        //self?.output?.reloadData(trip: trip, index: count)
                        _trips.append(trip)
                        if _trips.count == snapshot.childrenCount {
                            self?.output?.loadedListTrips(trips: _trips)
                        }
                    case .failure(let error):
                        print(error)
                    }
                    
                })
                //_trips.append(trip)
            }
            //self?.output?.loadedListTrips(trips: _trips)
        })
    }
    
    func didloadTargetPlaces(trip: Trip) {
        
    }
}
