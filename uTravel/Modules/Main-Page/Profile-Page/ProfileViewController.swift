//
//  ProfileViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ProfileViewController: UIViewController {
	private let output: ProfileViewOutput

    init(output: ProfileViewOutput) {
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                            target: self,
                                                            action: #selector(didTapSettingsButton))
	}
    
    @objc func didTapSettingsButton(){
        output.didTapSettingsButton()
    }
}

extension ProfileViewController: ProfileViewInput {
}
