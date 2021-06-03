//
//  TravelDetailViewController.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import UIKit
import PinLayout
final class TravelDetailViewController: UIViewController {
	private let output: TravelDetailViewOutput
    
    private let scrollView = UIScrollView()
    
    
    static var trip: Trip?
    
    private let headImageView = UIImageView()
    private let titleTravelLabel = UILabel()
    private let locationImageView = UIImageView()
    private let locationLabel = UILabel()
    private let dateLabel = UILabel()
    private let priceLabel = UILabel() // optional
    private let descriptionLabel = UILabel()
    
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
        
        
        headImageView.image = TravelDetailViewController.trip?.image//UIImage(named: "sea")
        headImageView.layer.cornerRadius = 20
        headImageView.layer.masksToBounds = true
        
        titleTravelLabel.text = TravelDetailViewController.trip?.title//"Зима в португалии"
        titleTravelLabel.textAlignment = .center
        titleTravelLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleTravelLabel.textColor = .black
        
        locationLabel.text = "Местоположение: \(TravelDetailViewController.trip!.location)"
        locationLabel.textAlignment = .center
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        locationLabel.textColor = .black
        
        [headImageView, titleTravelLabel, locationLabel].forEach{scrollView.addSubview($0)}
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
    }
}

extension TravelDetailViewController: TravelDetailViewInput {
}
