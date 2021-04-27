//
//  TravelDetailViewController.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import UIKit

final class TravelDetailViewController: UIViewController {
	private let output: TravelDetailViewOutput

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
        view.backgroundColor = .black
        title = "Detail"
	}
}

extension TravelDetailViewController: TravelDetailViewInput {
}
