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
    
    //private var userData: UserData!
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    
}

extension ProfileInteractor: ProfileInteractorInput {
    func removeObserves() {
        ref.removeAllObservers()
    }
    
    func updateUserData() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        let refUser = Database.database().reference(withPath: "users")
        refUser.observe(.value, with: { [weak self] (snapshot) in
            for item in snapshot.children {
                let userData = UserData(snapshot: item as! Firebase.DataSnapshot)
                self?.output?.loadedUserData(user: userData)
            }
        })
        
    }
    
    func updateListTravels() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("trips")
        var count = 0
        ref.observe(.value, with: { [weak self] (snapshot) in
            var _trips = Array<Trip>()
            for item in snapshot.children {
                var trip = Trip(snapshot: item as! Firebase.DataSnapshot)
                
                self?.imageLoader.image(with: trip.imageString, completion: { (result) in
                    switch result {
                    case .success(let image):
                        trip.image = image
                        self?.output?.reloadData(trip: trip, index: count)
                        count += 1
                    case .failure(let error):
                        print(error)
                    }
                    
                })
                _trips.append(trip)
            }
            self?.output?.loadedListTrips(trips: _trips)
        })
    }
}
