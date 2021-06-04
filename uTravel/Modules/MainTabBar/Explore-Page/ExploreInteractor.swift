//
//  ExploreInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import Firebase
import FirebaseDatabase

final class ExploreInteractor {
	weak var output: ExploreInteractorOutput?
    private var ref: DatabaseReference!
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
}

extension ExploreInteractor: ExploreInteractorInput {
    func loadListPlaces(ref: DatabaseReference) {
        
    }
    
    func updateListTravels() {
        ref = Database.database().reference(withPath: "users")
        ref.getData { [weak self] (error, snapshot) in
            var _trips = Array<Trip>()
            var newItems = Array<Firebase.DataSnapshot>()
            for item in snapshot.children {
                newItems.append(item as! Firebase.DataSnapshot)
            }

            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                //print("Got data \(snapshot.value!)")
                if snapshot.childrenCount > 10 {
                    let childrenCount = Int(snapshot.childrenCount)
                    for _ in 0...10 {
                        let randomNum = Int.random(in: 0...(childrenCount-1))
                        let user = UserData(snapshot: newItems[randomNum])
                        self?.ref = user.ref?.child("trips")
                        self?.ref.observe(.value, with: { [weak self] (snapshot) in
                            for item in snapshot.children {
                                var trip = Trip(snapshot: item as! Firebase.DataSnapshot)
                                self?.imageLoader.image(with: trip.imageString, completion: { (result) in
                                    switch result {
                                    case .success(let image):
                                        trip.image = image
                                        _trips.append(trip)
                                        if _trips.count == snapshot.childrenCount {
                                            self?.output?.loadedListTrips(trips: _trips)
                                        }
                                    case .failure(let error):
                                        print(error)
                                    }
                                })
                            }
                        })
                    }
                }
                else {
                    for item in snapshot.children {
                        var countTrips = 0
                        let user = UserData(snapshot: item as! Firebase.DataSnapshot)
                        self?.ref = user.ref?.child("trips")
                        self?.ref.observe(.value, with: { [weak self] (snapshot) in
                            for item in snapshot.children {
                                var trip = Trip(snapshot: item as! Firebase.DataSnapshot)
                                self?.imageLoader.image(with: trip.imageString, completion: {[weak self] (result) in
                                    switch result {
                                    case .success(let image):
                                        trip.image = image
                                        _trips.append(trip)
                                        countTrips += 1
                                        if countTrips == snapshot.childrenCount {
                                            self?.output?.loadedListTrips(trips: _trips)
                                        }
                                    case .failure(let error):
                                        print(error)
                                    }
                                })
                            }
                        })
                    }
                }
            }
            else {
                print("No data available")
            }
            //self?.output?.loadedListTrips(trips: _trips)
        }
    }
    
}
