//
//  Trip.swift
//  uTravel
//
//  Created by Dmitry on 01.06.2021.
//

import Foundation
import FirebaseDatabase
import UIKit

struct Trip {
    let title: String
    var image: UIImage
    var imageString: String
    let location: String
    let season: String
    let date: String
    let price: String
    let userId: String
    let description: String
    let ref: FirebaseDatabase.DatabaseReference?
    
    init(title: String, image: UIImage, location: String, season: String, date: String, price: String, userId: String, description: String){
        self.title = title
        self.image = image
        self.location = location
        self.season = season
        self.date = date
        self.price = price
        self.userId = userId
        self.imageString = ""
        self.ref = nil
        self.description = description
    }
    init(snapshot: FirebaseDatabase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        imageString = snapshotValue["image"] as! String
        location = snapshotValue["location"] as! String
        season = snapshotValue["season"] as! String
        date = snapshotValue["date"] as! String
        price = snapshotValue["price"] as! String
        userId = snapshotValue["userId"] as! String
        description = snapshotValue["description"] as! String
        image = UIImage()
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["title": title, "image": imageString, "location": location, "season": season, "date": date, "price": price, "userId": userId, "description": description]
    }
}
