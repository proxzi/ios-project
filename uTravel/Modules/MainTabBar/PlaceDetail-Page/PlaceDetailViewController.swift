//
//  PlaceDetailViewController.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit
import PinLayout
import KMPlaceholderTextView
import Cosmos

final class PlaceDetailViewController: UIViewController {
	private let output: PlaceDetailViewOutput
    
    private let scrollView = UIScrollView()
    
    
    var place: Place?
    
    private let headImageView = UIImageView()
    private let titlePlaceLabel = UILabel()
    private let classLabel = UILabel()
    private let ratingLabel = UILabel()
    private let descriptionHeadLabel = UILabel()
    private let descriptionTextView = KMPlaceholderTextView()
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.rating = 0.0
        return view
    }()
    
    init(output: PlaceDetailViewOutput) {
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
        
        headImageView.image = place?.image//UIImage(named: "sea")
        headImageView.layer.cornerRadius = 20
        headImageView.layer.masksToBounds = true
        
        titlePlaceLabel.text = place?.title//"Зима в португалии"
        titlePlaceLabel.textAlignment = .left
        titlePlaceLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titlePlaceLabel.textColor = .black
        
        
        ratingLabel.text = "Рейтинг места:"
        ratingLabel.textAlignment = .left
        ratingLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        ratingLabel.textColor = .black

        cosmosView.rating = Double(place!.rating)
        cosmosView.isUserInteractionEnabled = false
        
        classLabel.text = "Категория: \(String(place!.classPlace))"
        classLabel.textAlignment = .left
        classLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        classLabel.textColor = .black
        
        descriptionHeadLabel.text = "Описание:"
        descriptionHeadLabel.textAlignment = .left
        descriptionHeadLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        descriptionHeadLabel.textColor = .black
        
        
        descriptionTextView.text = place?.description
        descriptionTextView.font = UIFont.systemFont(ofSize: 14, weight: .light)
        descriptionTextView.isUserInteractionEnabled = false
        
        [headImageView, cosmosView, titlePlaceLabel, ratingLabel, classLabel, descriptionHeadLabel, descriptionTextView].forEach{scrollView.addSubview($0)}
        
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
        titlePlaceLabel.pin
            .below(of: headImageView)
            .sizeToFit()
            .marginTop(28)
            .left(20)
        ratingLabel.pin
            .below(of: titlePlaceLabel)
            .sizeToFit()
            .marginTop(20)
            .left(20)
        cosmosView.pin
            .below(of: ratingLabel)
            .left(20)
        classLabel.pin
            .below(of: cosmosView)
            .marginTop(5)
            .left(20)
            .sizeToFit()
        descriptionHeadLabel.pin
            .below(of: classLabel)
            .marginTop(5)
            .left(20)
            .sizeToFit()
        descriptionTextView.pin
            .below(of: descriptionHeadLabel)
            .marginTop(5)
            .horizontally(20)
            .bottom(view.pin.safeArea.bottom + 5)
    }
}

extension PlaceDetailViewController: PlaceDetailViewInput {
}
