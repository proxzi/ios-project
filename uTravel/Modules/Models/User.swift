//
//  User.swift
//  uTravel
//
//  Created by Dmitry on 01.06.2021.
//

import Foundation

import Firebase

struct User {
    let uid: String
    let email: String

    init(user: Firebase.User){
        self.uid = user.uid
        self.email = user.email!
    }
}

struct UserData {
    let email: String
    let name: String
    let surname: String
    let sex: String
    var profileImage: UIImage?
    var profileImageString: String
    let location: String
    let description: String
    var backgroundImage: UIImage?
    var backgroundImageString: String
    let ref: FirebaseDatabase.DatabaseReference?
    
    init(email: String, name: String, surname: String, sex: String, profileImage: UIImage, location: String, description: String, backgroundImage: UIImage){
        self.email = email
        self.name = name
        self.surname = surname
        self.sex = sex
        self.profileImage = profileImage
        self.location = location
        self.description = description
        self.backgroundImage = backgroundImage
        self.ref = nil
        self.backgroundImageString = ""
        self.profileImageString = ""
    }
    
    init(email: String, name: String, surname: String, sex: String) {
        self.email = email
        self.name = name
        self.surname = surname
        self.sex = sex
        self.profileImage = nil
        self.location = ""
        self.description = ""
        self.backgroundImage = nil
        self.ref = nil
        self.backgroundImageString = ""
        self.profileImageString = ""
    }
    
    init(snapshot: FirebaseDatabase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        email = snapshotValue["email"] as! String
        name = snapshotValue["name"] as! String
        surname = snapshotValue["surname"] as! String
        sex = snapshotValue["sex"] as! String
        ref = snapshot.ref
        profileImage = nil
        location = ""//snapshotValue["location"] as! String
        description = ""//snapshotValue["description"] as! String
        backgroundImage = nil
        backgroundImageString = ""//snapshotValue["backgroundImage"] as! String
        profileImageString = ""//snapshotValue["profileImage"] as! String
    }
    
    func convertToDictionary() -> Any {
        return ["email": email, "name": name, "surname": surname, "sex": sex, "profileImage": profileImageString, "backgroundImage": backgroundImageString, "location": location, "description": description]
    }
}

