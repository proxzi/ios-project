//
//  ProfileSettingsInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import Foundation
import Firebase
final class ProfileSettingsInteractor {
	weak var output: ProfileSettingsInteractorOutput?
}

extension ProfileSettingsInteractor: ProfileSettingsInteractorInput {
    func didTapLogOutButton() {
        do {
            try Auth.auth().signOut()
            self.output?.successfulLogOut()
        }
        catch {
            print("An error occurred")
        }
        
    }
}

