//
//  TravelDetailViewController.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import UIKit
import PinLayout
import KMPlaceholderTextView

final class TravelDetailViewController: UIViewController {
	private let output: TravelDetailViewOutput
    
    private let collectionPlaceView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal

        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    private let scrollView = UIScrollView()
    
    
    var trip: Trip?
    var places = Array<Place>()
    
    private let headImageView = UIImageView()
    private let titleTravelLabel = UILabel()
    private let locationImageView = UIImageView()
    private let locationLabel = UILabel()
    private let dateLabel = UILabel()
    private let priceLabel = UILabel()
    private let descriptionHeadLabel = UILabel()
    private let descriptionTextView = KMPlaceholderTextView()
    private let headCollectionPlaceLabel = UILabel()
    
    private let hotPlaceLabel = UILabel()
    // collection for hotPlace
    
    private let audioGuidesLabel = UILabel()
    // collection for audioGuides
    
    init(output: TravelDetailViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionPlaceView.backgroundColor = .systemBackground
        collectionPlaceView.dataSource = self
        collectionPlaceView.delegate = self
        collectionPlaceView.register(TravelDetailCollectionViewPlaceCell.self, forCellWithReuseIdentifier: "TravelDetailCollectionViewPlaceCell")
        
        headImageView.image = trip?.image//UIImage(named: "sea")
        headImageView.layer.cornerRadius = 20
        headImageView.layer.masksToBounds = true
        
        titleTravelLabel.text = trip?.title//"Зима в португалии"
        titleTravelLabel.textAlignment = .center
        titleTravelLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleTravelLabel.textColor = .black
        
        locationLabel.text = "Местоположение: \(trip?.location ?? "")"
        locationLabel.textAlignment = .left
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        locationLabel.textColor = .black
        
        dateLabel.text = "Кол-во дней: \(trip?.date ?? "")"
        dateLabel.textAlignment = .left
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        dateLabel.textColor = .black
        
        priceLabel.text = "\(trip?.price ?? "")$"
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        priceLabel.textColor = .white
        priceLabel.layer.cornerRadius = 7
        priceLabel.layer.masksToBounds = true
        priceLabel.backgroundColor = UIColor(red: 255/255,
                                               green: 125/255,
                                               blue: 13/255,
                                               alpha: 1.0)
        
        descriptionHeadLabel.text = "Описание:"
        descriptionHeadLabel.textAlignment = .left
        descriptionHeadLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        descriptionHeadLabel.textColor = .black
        
        headCollectionPlaceLabel.text = "Оцененные места:"
        headCollectionPlaceLabel.textAlignment = .left
        headCollectionPlaceLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        headCollectionPlaceLabel.textColor = .black
        
        descriptionTextView.text = trip?.description
        descriptionTextView.font = UIFont.systemFont(ofSize: 14, weight: .light)
        descriptionTextView.isUserInteractionEnabled = false
        
        [headImageView, titleTravelLabel, locationLabel, dateLabel, priceLabel, descriptionHeadLabel, descriptionTextView, collectionPlaceView, headCollectionPlaceLabel].forEach{scrollView.addSubview($0)}
        view.addSubview(scrollView)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.pin
            .all(view.pin.safeArea)
        headImageView.pin
            .top(5)
            .horizontally(20)
            .height(200)
        titleTravelLabel.pin
            .below(of: headImageView)
            .sizeToFit()
            .marginTop(28)
            .left(20)
        locationLabel.pin
            .below(of: titleTravelLabel)
            .sizeToFit()
            .marginTop(10)
            .left(20)
        dateLabel.pin
            .below(of: locationLabel)
            .sizeToFit()
            .marginTop(5)
            .left(20)
        priceLabel.pin
            .below(of: headImageView)
            .right(20)
            .height(23)
            .width(62)
            .marginTop(28)
        headCollectionPlaceLabel.pin
            .below(of: dateLabel)
            .sizeToFit()
            .marginTop(5)
            .left(20)
        
        collectionPlaceView.pin
            .below(of: headCollectionPlaceLabel)
            .marginTop(10)
            .horizontally(10)
            .height(110)
        
        descriptionHeadLabel.pin
            .below(of: collectionPlaceView)
            .sizeToFit()
            .marginTop(10)
            .left(20)
        descriptionTextView.pin
            .below(of: descriptionHeadLabel)
            .horizontally(20)
            .bottom(view.pin.safeArea)
    }
}

extension TravelDetailViewController: TravelDetailViewInput {
}

extension TravelDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelDetailCollectionViewPlaceCell", for: indexPath) as? TravelDetailCollectionViewPlaceCell else {
            return .init()
        }
        cell.configure(with: places[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
//        if indexPath.row == 0 {
//            output.didSelectItemCollection(index: idPlace)
//            idPlace += 1
//        }
//        else {
           output.didSelectItemCollection(place: places[indexPath.row])
//        }
        
        //output.didSelectItemCollection()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availableWidth = collectionView.bounds.width - 2
//        let sideLength = availableWidth
        
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
