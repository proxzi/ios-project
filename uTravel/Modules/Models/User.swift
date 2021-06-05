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
    var name: String
    var surname: String
    let sex: String
    var profileImage: UIImage?
    var profileImageString: String
    var location: String
    var description: String
    var backgroundImage: UIImage?
    var backgroundImageString: String
    let registerDate: String
    let ref: FirebaseDatabase.DatabaseReference?
    
    init(email: String, name: String, surname: String, sex: String, profileImage: UIImage, location: String, description: String, backgroundImage: UIImage, registerDate: String){
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
        self.registerDate = registerDate
    }
    
//    init(email: String, name: String, surname: String, sex: String, registerDate: String) {
//        self.email = email
//        self.name = name
//        self.surname = surname
//        self.sex = sex
//        self.profileImage = nil
//        self.location = ""
//        self.description = ""
//        self.backgroundImage = nil
//        self.ref = nil
//        self.backgroundImageString = ""
//        self.profileImageString = ""
//        self.registerDate = registerDate
//    }
    init(snapshot: FirebaseDatabase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        email = snapshotValue["email"] as! String
        name = snapshotValue["name"] as! String
        surname = snapshotValue["surname"] as! String
        sex = snapshotValue["sex"] as! String
        backgroundImageString = snapshotValue["backgroundImage"] as! String
        profileImageString = snapshotValue["profileImage"] as! String
        registerDate = snapshotValue["registerDate"] as! String
        location = snapshotValue["location"] as! String
        description = snapshotValue["description"] as! String
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["email": email, "name": name, "surname": surname, "sex": sex, "profileImage": profileImageString, "backgroundImage": backgroundImageString, "location": location, "description": description, "registerDate": registerDate]
    }
//    func convertToDictionary(with key: String) -> Any {
//        return ["/email/\(key)": email, "/name/\(key)": name, "/surname/\(key)": surname, "/sex/\(key)": sex, "/profileImage/\(key)": profileImageString, "/backgroundImage/\(key)": backgroundImageString, "/location/\(key)": location, "/description/\(key)": description, "/registerDate/\(key)": registerDate]
//    }
}

