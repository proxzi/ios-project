//
//  Place.swift
//  uTravel
//
//  Created by Dmitry on 01.06.2021.
//

import Foundation
import FirebaseDatabase
import UIKit

struct Place {
    var id: Int
    let title: String
    var image: UIImage?
    var imageString: String
    let rating: Int
    let description: String
    let classPlace: String
    //let userId: String
    let ref: FirebaseDatabase.DatabaseReference?
    
    init(id: Int, title: String, image: UIImage, rating: Int, description: String, classPlace: String){
        self.id = id
        self.title = title
        self.image = image
        self.rating = rating
        self.description = description
        self.classPlace = classPlace
        self.imageString = ""
        //self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: FirebaseDatabase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshotValue["id"] as! Int
        title = snapshotValue["title"] as! String
        imageString = snapshotValue["image"] as! String
        rating = snapshotValue["rating"] as! Int
        description = snapshotValue["description"] as! String
        classPlace = snapshotValue["classPlace"] as! String
        image = nil
        //userId = snapshotValue["userId"] as! String
        ref = snapshot.ref
    }
    func convertToDictionary() -> Any {
        return ["id": id, "title": title, "image": imageString, "rating": rating, "description": description, "classPlace": classPlace]
    }
}
