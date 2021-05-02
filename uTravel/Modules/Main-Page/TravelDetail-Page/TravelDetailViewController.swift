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

    private let headImageView = UIImageView()
    private let titleTravelLabel = UILabel()
    private let locationImageView = UIImageView()
    private let locationLabel = UILabel()
    private let dateLabel = UILabel()
    private let priceLabel = UILabel()
    
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
        
        
        headImageView.image = UIImage(named: "sea")
        headImageView.layer.cornerRadius = 20
        headImageView.layer.masksToBounds = true
        
        titleTravelLabel.text = "Зима в португалии"
        titleTravelLabel.textAlignment = .center
        titleTravelLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleTravelLabel.textColor = .black
        
        [headImageView, titleTravelLabel].forEach{view.addSubview($0)}
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headImageView.pin
            .top(view.pin.safeArea)
            .horizontally(20)
            .height(200)
        titleTravelLabel.pin
            .below(of: headImageView)
            .sizeToFit()
            .marginTop(28)
            .left(20)
    }
}

extension TravelDetailViewController: TravelDetailViewInput {
}
