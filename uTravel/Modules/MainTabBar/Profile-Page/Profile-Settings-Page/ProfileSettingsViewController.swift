//
//  ProfileSettingsViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import PinLayout

final class ProfileSettingsViewController: UIViewController {
	private let output: ProfileSettingsViewOutput
    
    private let LogOutButton = UIButton()
    private let LogOutButtonView = UIView()
    
    init(output: ProfileSettingsViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        LogOutButton.setTitle("Выйти", for: .normal)
        LogOutButton.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
        LogOutButton.layer.cornerRadius = 7
        LogOutButton.layer.masksToBounds = true
        LogOutButton.backgroundColor = UIColor(red: 255/255,
                                              green: 125/255,
                                              blue: 13/255,
                                              alpha: 1)
        
        
        LogOutButtonView.layer.shadowColor = UIColor(red: 255/255,
                                               green: 209/255,
                                               blue: 170/255,
                                               alpha: 1).cgColor
        LogOutButtonView.layer.shadowRadius = 4
        LogOutButtonView.layer.shadowOffset = CGSize(width: 0, height: 5)
        LogOutButtonView.layer.shadowOpacity = 0.8
        LogOutButtonView.isUserInteractionEnabled = true
        view.backgroundColor = .white
        LogOutButtonView.addSubview(LogOutButton)
        [LogOutButtonView].forEach{ view.addSubview($0)}
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        LogOutButtonView.pin
            .height(40)
            .horizontally(40)
            .top(200)
        LogOutButton.pin
            .height(40)
            .horizontally()
    }
    
    @objc
    func didTapLogOutButton(){
        output.didTapLogOutButton()
    }
}

extension ProfileSettingsViewController: ProfileSettingsViewInput {
}
