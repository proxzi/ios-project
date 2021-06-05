//
//  ProfileSettingsViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import PinLayout
import KMPlaceholderTextView

final class ProfileSettingsViewController: UIViewController {
	private let output: ProfileSettingsViewOutput
    
    private let LogOutButton = UIButton()
    private let LogOutButtonView = UIView()
    
    private let profileImage = UIImageView()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let locationTextField = UITextField()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = KMPlaceholderTextView()
    //private let backgroundImage = UIImageView()
    var user: UserData!
    
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

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(didTapDoneBarButton))
        
        
        let gestureRecognizerImage = UITapGestureRecognizer(target: self, action: #selector(didTapProfileImageView))
        
        profileImage.image = UIImage(named: "profileImage")
        if (user.profileImage != nil) {
            profileImage.image = user.profileImage
        }
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true
        profileImage.addGestureRecognizer(gestureRecognizerImage)
        profileImage.isUserInteractionEnabled = true
        
        if !user.name.isEmpty {
            nameTextField.text = user.name
        }
        nameTextField.placeholder = "Имя..."
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        if !user.surname.isEmpty {
            surnameTextField.text = user.surname
        }
        
        surnameTextField.placeholder = "Фамилия..."
        surnameTextField.layer.borderWidth = 0.5
        surnameTextField.layer.cornerRadius = 5
        surnameTextField.layer.masksToBounds = true
        surnameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        if !user.location.isEmpty {
            locationTextField.text = user.location
        }
        
        locationTextField.placeholder = "Город..."
        locationTextField.layer.borderWidth = 0.5
        locationTextField.layer.cornerRadius = 5
        locationTextField.layer.masksToBounds = true
        locationTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        
        descriptionLabel.text = "О себе:"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        descriptionLabel.textColor = .black
        
        if !user.description.isEmpty {
            descriptionTextView.text = user.description
        }
        
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor(red: 255/255,
                                                        green: 125/255,
                                                        blue: 13/255,
                                                        alpha: 1).cgColor
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.masksToBounds = true
        descriptionTextView.placeholder = "Расскажите о себе..."
        descriptionTextView.placeholderColor = .gray
        descriptionTextView.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
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
        [LogOutButtonView, profileImage, nameTextField, surnameTextField, locationTextField, descriptionLabel, descriptionTextView].forEach{ view.addSubview($0)}
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        profileImage.pin
            .top(view.pin.safeArea + 40)
            .left(20)
            .height(100)
            .width(100)
        nameTextField.pin
            .after(of: profileImage)
            .top(view.pin.safeArea + 20)
            .horizontally(10)
            .marginLeft(5)
            .height(40)
        surnameTextField.pin
            .after(of: profileImage)
            .below(of: nameTextField)
            .marginTop(5)
            .horizontally(10)
            .height(40)
            .marginLeft(5)
        locationTextField.pin
            .after(of: profileImage)
            .below(of: surnameTextField)
            .marginTop(5)
            .marginLeft(5)
            .horizontally(10)
            .height(40)
        
        descriptionLabel.pin
            .below(of: profileImage)
            .marginTop(15)
            .sizeToFit()
            .left(20)
        descriptionTextView.pin
            .below(of: descriptionLabel)
            .marginTop(5)
            .horizontally(20)
            .height(80)
        
        LogOutButtonView.pin
            .bottom(view.pin.safeArea + 20)
            .marginTop(15)
            .height(40)
            .horizontally(40)
        LogOutButton.pin
            .height(40)
            .horizontally()
        
    }
    
    @objc
    func didTapLogOutButton() {
        output.didTapLogOutButton()
    }
    @objc
    func didTapDoneBarButton() {
        
        user.profileImage = profileImage.image
        user.name = nameTextField.text ?? ""
        user.surname = surnameTextField.text ?? ""
        user.location = locationTextField.text ?? ""
        user.description = descriptionTextView.text ?? ""
        output.didTapDoneBarButton(user: user)
    }
    @objc
    func didTapProfileImageView() {
        output.didTapProfileImageView()
    }
}

extension ProfileSettingsViewController: ProfileSettingsViewInput {
    func savedData() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func downloadBackgroundImage(image: UIImage?) {
        
    }
    
    func downloadProfileImage(image: UIImage?) {
        profileImage.image = image
    }
}
