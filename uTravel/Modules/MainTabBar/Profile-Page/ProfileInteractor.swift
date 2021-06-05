//
//  ProfileInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import Firebase
import FirebaseDatabase

final class ProfileInteractor {
	weak var output: ProfileInteractorOutput?

    private var user: User!
    private var ref: DatabaseReference!
    private var places = Array<Place>()
    //private var userData: UserData!
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    private var firsttime = true
    
}

extension ProfileInteractor: ProfileInteractorInput {
    func loadListPlaces(ref: FirebaseDatabase.DatabaseReference) {
        places.removeAll()
        let placeRef = ref.child("places")
        placeRef.observe(.value, with: { [weak self] (snapshot) in
            self?.places.removeAll()
            for item in snapshot.children {
                var place = Place(snapshot: item as! Firebase.DataSnapshot)
                self?.imageLoader.image(with: place.imageString, completion: { [weak self] (result) in
                    switch result {
                    case .success(let image):
                        place.image = image
                        self?.places.append(place)
                        if self?.places.count == Int(snapshot.childrenCount) {
                            self?.output?.loadedPlaces(places: (self?.places)!)
                            self?.firsttime = false
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
            }
        })
        if !firsttime {
            output?.loadedPlaces(places: places)
        }
    }
    
    func removeObserves() {
        ref.removeAllObservers()
    }
    
    func updateUserData() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        let refUser = Database.database().reference(withPath: "users").child("\(user.uid)")

        refUser.observe(.value, with: { [weak self] (snapshot) in
            var userData = UserData(snapshot: snapshot)
            if !(userData.profileImageString.isEmpty) {
                self?.imageLoader.image(with: userData.profileImageString, completion: { [weak self] (result) in
                    switch result {
                    case .success(let image):
                        userData.profileImage = image
                        self?.output?.loadedUserData(user: userData)
                    case .failure(let error):
                        print(error)
                        userData.profileImage = UIImage(named: "profileImage")
                        self?.output?.loadedUserData(user: userData)
                    }
                })
            }
            else {
                self?.output?.loadedUserData(user: userData)
            }
        })
        
    }
    
    func updateListTravels() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("trips")
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
}
