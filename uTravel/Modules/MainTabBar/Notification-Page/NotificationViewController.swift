//
//  NotificationViewController.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit

final class NotificationViewController: UIViewController {
	private let output: NotificationViewOutput

    init(output: NotificationViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .green
	}
}

extension NotificationViewController: NotificationViewInput {
}
