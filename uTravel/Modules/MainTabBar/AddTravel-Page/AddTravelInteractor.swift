//
//  AddTravelInteractor.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
//import Firebase

final class AddTravelInteractor {
	weak var output: AddTravelInteractorOutput?
    
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    
    private var imageString: String?
}

extension AddTravelInteractor: AddTravelInteractorInput {
    func saveTravel() {
        
    }
    
    func imageUpload(with image: UIImage, title: String){
        imageLoader.upload(image: image) { [weak self] (result) in
            switch result {
            case .success(let name):
                self?.output?.didReceiveImage(toString: name)
            case .failure(let error):
                self?.output?.didReceive(error: error)
            }
        }
    }
    
}
