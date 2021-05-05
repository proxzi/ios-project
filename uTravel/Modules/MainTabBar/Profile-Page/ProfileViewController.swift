//
//  ProfileViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import SwiftSVG
import PinLayout

final class ProfileViewController: UIViewController {
	private let output: ProfileViewOutput

    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical

        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    private let profileView = UIView()
    
    private let headImage = UIImageView()
    private let profileImage = UIImageView()
    private let fullnameLabel = UILabel()
    private let aboutLabel = UILabel()
    private let countryLabel = UILabel()
    private let dateSignInLabel = UILabel()
    private let statusImage = UIImageView()
    
    init(output: ProfileViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        let settingsImage = UIImage(named: "settings")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(didTapSettingsButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        title = "Профиль"
        
        view.backgroundColor = .white
        
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TravelCollectionViewProfileCell.self, forCellWithReuseIdentifier: "TravelCollectionViewProfileCell")
    
        headImage.image = UIImage(named: "headImage")
        headImage.layer.cornerRadius = 10
        headImage.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        headImage.layer.masksToBounds = true
        
        profileImage.image = UIImage(named: "profileImage")
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = true
        
        fullnameLabel.text = "Oliver Bether"
        fullnameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        fullnameLabel.textColor = .black
        
        aboutLabel.text = "Hello world!"
        aboutLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        aboutLabel.textColor = UIColor(red: 102/255,
                                          green: 102/255,
                                          blue: 102/255,
                                          alpha: 1.0)
        
        countryLabel.text = "Россия"
        countryLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        countryLabel.textColor = UIColor(red: 170/255,
                                         green: 170/255,
                                         blue: 170/255,
                                         alpha: 1.0)
        
        dateSignInLabel.text = "Январь 2020"
        dateSignInLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        dateSignInLabel.textColor = UIColor(red: 170/255,
                                         green: 170/255,
                                         blue: 170/255,
                                         alpha: 1.0)
        
        [headImage, profileImage, fullnameLabel, aboutLabel, countryLabel, dateSignInLabel].forEach{ profileView.addSubview($0)}
        [collectionView, profileView].forEach{ view.addSubview($0)}
        
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileView.pin
            .top(view.pin.safeArea.top)
            .horizontally()
            .height(250)
        headImage.pin
            .height(130)
            .horizontally()
        profileImage.pin
            .below(of: headImage)
            .marginTop(-30)
            .left(40)
            .height(60)
            .width(60)
        fullnameLabel.pin
            .below(of: profileImage)
            .sizeToFit()
            .marginTop(12)
            .left(19)
        aboutLabel.pin
            .below(of: fullnameLabel)
            .sizeToFit()
            .marginTop(12)
            .left(19)
        countryLabel.pin
            .below(of: aboutLabel)
            .sizeToFit()
            .marginTop(18)
            .left(19)
        dateSignInLabel.pin
            .below(of: aboutLabel)
            .after(of: countryLabel)
            .sizeToFit()
            .marginTop(18)
            .marginLeft(12)
        collectionView.pin
            .below(of: countryLabel)
            .marginTop(10)
            .horizontally()
            .bottom(view.pin.safeArea.bottom)
    }
    
    @objc func didTapSettingsButton(){
        output.didTapSettingsButton()
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCollectionViewProfileCell", for: indexPath) as? TravelCollectionViewProfileCell else {
            return .init()
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        output.didSelectItemCollection()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availableWidth = collectionView.bounds.width - 2
//        let sideLength = availableWidth
        
        return CGSize(width: 335, height: 132)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

extension ProfileViewController: ProfileViewInput {
}
