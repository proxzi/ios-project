//
//  TravelTableViewCell.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//

import UIKit
import SwiftSVG
import PinLayout

class TravelCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let locationView = UIView(SVGNamed: "location")
    private let dateLabel = UILabel()
    private let seasonLabel = UILabel()
    private let locationLabel = UILabel()
    private let priceLabel = UILabel()
    
    private let dateView = UIView()
    private let seasonView = UIView()
    private let priceView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        titleLabel.text = "Winter in Portugal"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        dateLabel.text = "7 days"
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        dateLabel.textColor = .black
        
        seasonLabel.text = "winter"
        seasonLabel.textAlignment = .center
        seasonLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        seasonLabel.textColor = .black
        
        priceLabel.text = "2 000$"
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        priceLabel.textColor = .white
        
        
        locationLabel.text = "Lisabon"
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        locationLabel.textColor = UIColor(red: 170/255,
                                          green: 170/255,
                                          blue: 170/255,
                                          alpha: 1.0)
        
        locationLabel.textAlignment = .center
        
        seasonView.layer.cornerRadius = 5
        seasonView.layer.masksToBounds = true
        seasonView.backgroundColor = UIColor(red: 204/255,
                                                 green: 204/255,
                                                 blue: 204/255,
                                                 alpha: 1.0)
        
        dateView.layer.cornerRadius = 5
        dateView.layer.masksToBounds = true
        dateView.backgroundColor = UIColor(red: 204/255,
                                                 green: 204/255,
                                                 blue: 204/255,
                                                 alpha: 1.0)
        
        priceView.layer.cornerRadius = 7
        priceView.layer.masksToBounds = true
        priceView.backgroundColor = UIColor(red: 255/255,
                                           green: 125/255,
                                           blue: 13/255,
                                           alpha: 1.0)
        
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
        
        dateView.addSubview(dateLabel)
        seasonView.addSubview(seasonLabel)
        priceView.addSubview(priceLabel)
        
        [titleLabel, dateView, iconImageView, seasonView, priceView, locationView, locationLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.pin
            .vCenter()
            .left(15)
            .height(92)
            .width(70)
        titleLabel.pin
            .after(of: iconImageView)
            .top(29)
            .marginLeft(11)
            .sizeToFit()
        
        locationView.pin
            .after(of: iconImageView)
            .below(of: titleLabel)
            .marginLeft(15)
            .marginTop(4)
        
        locationLabel.pin
            .sizeToFit()
            .after(of: locationView)
            .below(of: titleLabel)
            .marginLeft(18)
            .marginTop(4)
        
        dateView.pin
            .after(of: iconImageView)
            .below(of: locationLabel)
            .marginLeft(15)
            .marginTop(13)
            .height(18)
            .width(42)
        
        dateLabel.pin
            .sizeToFit()
            .center()

        seasonView.pin
            .after(of: dateView)
            .below(of: locationLabel)
            .marginTop(13)
            .marginLeft(12)
            .height(18)
            .width(52)
        
        seasonLabel.pin
            .sizeToFit()
            .center()
        
        priceView.pin
            .after(of: titleLabel)
            .top(54)
            .marginLeft(21)
            .height(23)
            .width(62)
        priceLabel.pin
            .sizeToFit()
            .center()
    }
}
