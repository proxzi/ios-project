//
//  AddTravelViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class AddTravelViewController: UIViewController {
	private let output: AddTravelViewOutput

    init(output: AddTravelViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .blue
	}
}

extension AddTravelViewController: AddTravelViewInput {
}
