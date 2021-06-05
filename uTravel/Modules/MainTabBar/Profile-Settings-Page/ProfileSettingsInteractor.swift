//
//  ProfileSettingsInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import Firebase
import FirebaseDatabase

final class ProfileSettingsInteractor {
	weak var output: ProfileSettingsInteractorOutput?
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    private var ref: DatabaseReference!
    private var user: UserData!
}

extension ProfileSettingsInteractor: ProfileSettingsInteractorInput {
    func saveData(user: UserData) {
        self.user = user
        guard let currentUser = Auth.auth().currentUser else { return }
        ref = Database.database().reference(withPath: "users").child(String(currentUser.uid))
        imageUpload(image: (user.profileImage)!, title: "profile Image")
        
    }
    
    func updateJSON() {
        //ref.child("name").setValue(user.name)
        guard let key = ref.childByAutoId().key else { return }
        ref.updateChildValues(user.convertToDictionary() as! [AnyHashable : Any])
        
        //ref.setValue(user.convertToDictionary())
        self.output?.successfulSavedData()
    }
    
    func didTapLogOutButton() {
        do {
            try Auth.auth().signOut()
            self.output?.successfulLogOut()
        }
        catch {
            print("An error occurred")
        }
        
    }
    
    func imageUpload(image: UIImage, title: String){
        imageLoader.upload(image: image) { [weak self] (result) in
            switch result {
            case .success(let name):
                self?.user.profileImageString = name
                self?.updateJSON()
            case .failure(let error):
                print("ProfileInteractor error: \(error)")
                //self?.output?.didReceive(error: error)
            }
        }
    }
    
}

