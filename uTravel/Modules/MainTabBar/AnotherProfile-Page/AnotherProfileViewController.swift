//
//  AnotherProfileViewController.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//
//

import UIKit

final class AnotherProfileViewController: UIViewController {
    private let output: AnotherProfileViewOutput

    var user: UserData!
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
    
    private var trips = Array<Trip>()
    
    init(output: AnotherProfileViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        
        view.backgroundColor = .white
        
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TravelCollectionViewProfileCell.self, forCellWithReuseIdentifier: "TravelCollectionViewProfileCell")
    
        headImage.image = UIImage(named: "headImage") //user.backgroundImage
        headImage.layer.cornerRadius = 10
        headImage.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        headImage.layer.masksToBounds = true
        
        profileImage.image = user.profileImage
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = true
        
        fullnameLabel.text = "\(user.name) \(user.surname)"
        fullnameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        fullnameLabel.textColor = .black
        
        aboutLabel.text = user.description
        aboutLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        aboutLabel.textColor = UIColor(red: 102/255,
                                          green: 102/255,
                                          blue: 102/255,
                                          alpha: 1.0)
        
        countryLabel.text = user.location
        countryLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        countryLabel.textColor = UIColor(red: 170/255,
                                         green: 170/255,
                                         blue: 170/255,
                                         alpha: 1.0)
        
        dateSignInLabel.text = user.registerDate
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
}

extension AnotherProfileViewController: AnotherProfileViewInput {
}

extension AnotherProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
