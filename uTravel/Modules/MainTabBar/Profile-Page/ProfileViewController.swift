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
import KMPlaceholderTextView

final class ProfileViewController: UIViewController {
	private let output: ProfileViewOutput

    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical

        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    
    private let descriptionTextView = KMPlaceholderTextView()
    private let profileView = UIView()
    
    private let headImage = UIImageView()
    private let profileImage = UIImageView()
    private let fullnameLabel = UILabel()
    private let aboutLabel = UILabel()
    private let countryLabel = UILabel()
    private let dateSignInLabel = UILabel()
    private let statusImage = UIImageView()
    private var user: UserData!
    private var trips = Array<Trip>()
    
    init(output: ProfileViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.didLoadTravels()
        output.didLoadUserData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //output.didRemoveObserves()
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        let settingsImage = UIImage(named: "settings")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(didTapSettingsButton))
        navigationItem.rightBarButtonItem?.tintColor = .orange
        
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
        
        fullnameLabel.text = "                              "
        fullnameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        fullnameLabel.textColor = .black
        fullnameLabel.layer.backgroundColor = UIColor.gray.cgColor
        fullnameLabel.layer.cornerRadius = 7
        fullnameLabel.layer.masksToBounds = true
        
        descriptionTextView.text = ""
        descriptionTextView.font = UIFont.systemFont(ofSize: 14, weight: .light)
        descriptionTextView.textColor = UIColor(red: 102/255,
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
        
        
        
        [headImage, profileImage, fullnameLabel, countryLabel, dateSignInLabel, descriptionTextView].forEach{ profileView.addSubview($0)}
        [collectionView, profileView].forEach{ view.addSubview($0)}
        
        
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateLayout()
    }
    
    func updateLayout() {
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
        descriptionTextView.pin
            .below(of: fullnameLabel)
            .marginTop(12)
            .left(20)
            .horizontally(20)
            .height(40)
        countryLabel.pin
            .below(of: descriptionTextView)
            .sizeToFit()
            .marginTop(18)
            .left(20)
        dateSignInLabel.pin
            .below(of: descriptionTextView)
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
        output.didTapSettingsButton(user: self.user)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCollectionViewProfileCell", for: indexPath) as? TravelCollectionViewProfileCell else {
            return .init()
        }
        cell.configure(trip: trips[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        output.didSelectItemCollection(trip: trips[indexPath.row])
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
    func reloadData(trip: Trip, index: Int) {
        if index < trips.count {
            trips[index] = trip
            collectionView.reloadData()
        }
    }
    
    func loadedListTrips(trips: Array<Trip>) {
        self.trips = trips
        collectionView.reloadData()
    }
    
    func reloadUserData(user: UserData) {
        self.user = user
        fullnameLabel.layer.backgroundColor = UIColor.white.cgColor
        fullnameLabel.text = user.name + " " + user.surname
       // fullnameLabel.pin.sizeToFit()
        profileImage.image = user.profileImage
        countryLabel.text = user.location
        //countryLabel.pin.sizeToFit()
        dateSignInLabel.text = user.registerDate
        descriptionTextView.text = user.description
        updateLayout()
    }
}
