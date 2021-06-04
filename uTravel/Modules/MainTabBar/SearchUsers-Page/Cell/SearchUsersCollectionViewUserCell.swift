//
//  SearchUsersCollectionViewUserCell.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//


import UIKit
import PinLayout
import SwiftSVG

class SearchUsersCollectionViewUserCell: UICollectionViewCell {
    
    private let profileImageView = UIImageView()
    private let fullnameLabel = UILabel()
    private let locationView = UIView(SVGNamed: "location")
    private let locationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
       
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

        profileImageView.image = UIImage(named: "profileImage")
        profileImageView.layer.cornerRadius = 30
        profileImageView.layer.masksToBounds = true
        
        
        fullnameLabel.text = "Иванов Иван"
        fullnameLabel.textAlignment = .center
        fullnameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        locationLabel.text = "Москва"
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        locationLabel.textColor = UIColor(red: 170/255,
                                          green: 170/255,
                                          blue: 170/255,
                                          alpha: 1.0)
        
        locationLabel.textAlignment = .left
        
        [profileImageView, fullnameLabel, locationView, locationLabel].forEach { contentView.addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.pin
            .vCenter()
            .left(15)
            .height(80)
            .width(80)
        fullnameLabel.pin
            .after(of: profileImageView)
            .marginLeft(10)
            .vCenter(-10)
            .sizeToFit()
        locationView.pin
            .after(of: profileImageView)
            .below(of: fullnameLabel)
            .marginLeft(10)
            .marginTop(5)
            .width(15)
            .height(15)
        locationLabel.pin
            .after(of: locationView)
            .below(of: fullnameLabel)
            .marginLeft(5)
            .marginTop(5)
            .sizeToFit()
        
    }
    
    func configure(with user: UserData) {
        fullnameLabel.text = "\(user.name) \(user.surname)"
        profileImageView.image = user.profileImage
        locationLabel.text = user.location
    }

}
