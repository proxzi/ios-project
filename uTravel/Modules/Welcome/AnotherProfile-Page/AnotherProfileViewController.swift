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

    init(output: AnotherProfileViewOutput) {
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

extension AnotherProfileViewController: AnotherProfileViewInput {
}
