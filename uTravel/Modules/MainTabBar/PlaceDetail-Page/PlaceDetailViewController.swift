//
//  PlaceDetailViewController.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class PlaceDetailViewController: UIViewController {
	private let output: PlaceDetailViewOutput

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
	}
}

extension PlaceDetailViewController: PlaceDetailViewInput {
}
