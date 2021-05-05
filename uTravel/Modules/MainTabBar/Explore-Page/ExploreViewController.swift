//
//  ExploreViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import SwiftSVG
import PinLayout
final class ExploreViewController: UIViewController {
	private let output: ExploreViewOutput
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical

        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    
    private let findTextField = UITextField()
    private let searchGroup = UIView()
    
    private let searchImageView = UIImageView(image: UIImage(named: "search"))
    
    init(output: ExploreViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAddTravelButton))
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Исследовать"
        view.backgroundColor = .white
        
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TravelCollectionViewExploreCell.self, forCellWithReuseIdentifier: "TravelCollectionViewExploreCell")
        
        
        searchImageView.backgroundColor = .white
        
        findTextField.placeholder = "Найти поездку..."
        findTextField.layer.borderColor = UIColor(red: 238/255,
                                                 green: 238/255,
                                                 blue: 238/255,
                                                 alpha: 1).cgColor
        findTextField.layer.borderWidth = 1.5
        findTextField.layer.cornerRadius = 7
        findTextField.layer.masksToBounds = true
        findTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        searchGroup.isUserInteractionEnabled = true
        [findTextField, searchImageView].forEach{ searchGroup.addSubview($0)}
        [searchGroup, collectionView].forEach{ view.addSubview($0)}
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchGroup.pin
            .top(150)
            .horizontally(20)
            .height(40)
        findTextField.pin
            .height(40)
            .width(275)
            .left()
        searchImageView.pin.after(of: findTextField)
            .sizeToFit()
            .marginLeft(20)
        collectionView.pin
            .below(of: searchGroup)
            .marginTop(30)
            .horizontally()
            .height(65%)
        
    }
    
    @objc
    func didTapAddTravelButton(){
        output.didTapAddTravelButton()
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCollectionViewExploreCell", for: indexPath) as? TravelCollectionViewExploreCell else {
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


extension ExploreViewController: ExploreViewInput {
}
