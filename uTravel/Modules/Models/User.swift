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
    let ref: FirebaseDatabase.DatabaseReference?
    
    init(uid: String, email: String, name: String, surname: String, sex: String){
        self.email = email
        self.name = name
        self.surname = surname
        self.sex = sex
        self.ref = nil
    }
    
    init(snapshot: FirebaseDatabase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        email = snapshotValue["email"] as! String
        name = snapshotValue["name"] as! String
        surname = snapshotValue["surname"] as! String
        sex = snapshotValue["sex"] as! String
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["email": email, "name": name, "surname": surname, "sex": sex]
    }
}

