//
//  AddTravelPlaceCollectionView.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//

import UIKit
import SwiftSVG
import PinLayout

class TravelDetailCollectionViewPlaceCell: UICollectionViewCell {
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

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
        
        titleLabel.text = ""
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
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

        
        [iconImageView, titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.pin
            .all()
        titleLabel.pin
            .bottom(10)
            .horizontally(10)
            .sizeToFit()
            .wrapContent(.vertically)
    }
    
    func configure(with name: String) {
        iconImageView.image = UIImage(named: name)
    }
    
    func configure(with place: Place){
        iconImageView.image = place.image
        titleLabel.text = place.title
    }
}
