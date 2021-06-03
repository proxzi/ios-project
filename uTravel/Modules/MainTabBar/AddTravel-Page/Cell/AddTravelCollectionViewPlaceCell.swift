//
//  AddTravelPlaceCollectionView.swift
//  uTravel
//
//  Created by Dmitry on 04.05.2021.
//

import UIKit
import SwiftSVG
import PinLayout

class AddTravelCollectionViewPlaceCell: UICollectionViewCell {
    private let iconImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        iconImageView.image = UIImage(named: "sea")
        iconImageView.layer.cornerRadius = 15
        iconImageView.layer.masksToBounds = true
        
        backgroundColor = UIColor(red: 248/255,
                                  green: 248/255,
                                  blue: 248/255,
                                  alpha: 1.0)
        layer.cornerRadius = 15

        layer.masksToBounds = true
        contentView.clipsToBounds = true
        backgroundColor = .secondarySystemBackground
        contentView.backgroundColor = UIColor(red: 248/255,
                                              green: 248/255,
                                              blue: 248/255,
                                              alpha: 1.0)

        
        [iconImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.pin
            .all()
    }
    
    func configure(with name: String) {
        iconImageView.image = UIImage(named: name)
    }
    
    func configure(with place: Place){
        iconImageView.image = place.image
        
    }
}
