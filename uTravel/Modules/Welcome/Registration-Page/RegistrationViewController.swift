//
//  RegistrationViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import PinLayout

final class RegistrationViewController: UIViewController {
	private let output: RegistrationViewOutput
    
    private let scrollView = UIScrollView()
    
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let headLabel = UILabel()
    private let formRegistrationView = UIView()
    private let maleRButton = UIButton()
    private let femaleRButton = UIButton()
    private let loginEdit = UITextField()
    private let passwordEdit = UITextField()
    private let loginLabel = UILabel()
    private let passwordLabel = UILabel()
    private let repeatPasswordLabel = UILabel()
    private let repeatPasswordEdit = UITextField()
    private let regButton = UIButton()
    private let regButtonView = UIView()
    private var sex = "Мужчина"
    
    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    
    init(output: RegistrationViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        navigationItem.backBarButtonItem?.tintColor = UIColor(red: 102/255,
//                                                                         green: 102/255,
//                                                                         blue: 102/255,
//                                                                         alpha: 1)
//        navigationItem.backBarButtonItem?.title = "Назад"
        
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        
        headLabel.text = "Регистрация"
        headLabel.textAlignment = .center
        headLabel.font = UIFont.systemFont(ofSize: 38, weight: .regular)
        
        loginLabel.text = "Email"
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        loginLabel.textColor =  UIColor(red: 102/255,
                                           green: 102/255,
                                           blue: 102/255,
                                           alpha: 1)
        passwordLabel.text = "Пароль"
        passwordLabel.textAlignment = .center
        passwordLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        passwordLabel.textColor =  UIColor(red: 102/255,
                                           green: 102/255,
                                           blue: 102/255,
                                           alpha: 1)
        
        maleRButton.setTitle("Мужчина", for: .normal)
        maleRButton.setTitleColor(.white, for: .normal)
        maleRButton.backgroundColor = .orange
        maleRButton.layer.borderWidth = 1
        maleRButton.layer.borderColor = UIColor.orange.cgColor
        maleRButton.layer.cornerRadius = 7
        maleRButton.layer.masksToBounds = true
        maleRButton.addTarget(self, action: #selector(didTapRadioButton), for: .touchUpInside)
        
        femaleRButton.setTitle("Женщина", for: .normal)
        femaleRButton.setTitleColor(.black, for: .normal)
        femaleRButton.backgroundColor = .white
        femaleRButton.layer.borderWidth = 1
        femaleRButton.layer.borderColor = UIColor.gray.cgColor
        femaleRButton.layer.cornerRadius = 7
        femaleRButton.layer.masksToBounds = true
        femaleRButton.addTarget(self, action: #selector(didTapRadioButton), for: .touchUpInside)
        
        formRegistrationView.isUserInteractionEnabled = true
        
        loginEdit.placeholder = "Email"
        loginEdit.layer.borderColor = UIColor(red: 238/255,
                                              green: 238/255,
                                              blue: 238/255,
                                              alpha: 1).cgColor
        loginEdit.layer.borderWidth = 1.5
        loginEdit.layer.cornerRadius = 7
        loginEdit.layer.masksToBounds = true
        loginEdit.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        passwordEdit.placeholder = "Пароль"
        passwordEdit.layer.borderColor = UIColor(red: 238/255,
                                                 green: 238/255,
                                                 blue: 238/255,
                                                 alpha: 1).cgColor
        passwordEdit.layer.borderWidth = 1.5
        passwordEdit.layer.cornerRadius = 7
        passwordEdit.layer.masksToBounds = true
        passwordEdit.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        passwordEdit.isSecureTextEntry = true
        
        
        
        repeatPasswordLabel.text = "Повторите пароль"
        repeatPasswordLabel.textAlignment = .center
        repeatPasswordLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        repeatPasswordLabel.textColor =  UIColor(red: 102/255,
                                           green: 102/255,
                                           blue: 102/255,
                                           alpha: 1)
        
        repeatPasswordEdit.placeholder = "Повторите пароль"
        repeatPasswordEdit.layer.borderColor = UIColor(red: 238/255,
                                                 green: 238/255,
                                                 blue: 238/255,
                                                 alpha: 1).cgColor
        repeatPasswordEdit.layer.borderWidth = 1.5
        repeatPasswordEdit.layer.cornerRadius = 7
        repeatPasswordEdit.layer.masksToBounds = true
        repeatPasswordEdit.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        repeatPasswordEdit.isSecureTextEntry = true
        
        regButton.setTitle("Зарегистрироваться", for: .normal)
        regButton.addTarget(self, action: #selector(didTapRegButton), for: .touchUpInside)
        regButton.layer.cornerRadius = 7
        regButton.layer.masksToBounds = true
        regButton.backgroundColor = UIColor(red: 255/255,
                                              green: 125/255,
                                              blue: 13/255,
                                              alpha: 1)
        
        
        regButtonView.layer.shadowColor = UIColor(red: 255/255,
                                               green: 209/255,
                                               blue: 170/255,
                                               alpha: 1).cgColor
        regButtonView.layer.shadowRadius = 4
        regButtonView.layer.shadowOffset = CGSize(width: 0, height: 5)
        regButtonView.layer.shadowOpacity = 0.8
        regButtonView.isUserInteractionEnabled = true
        
        nameLabel.text = "Имя"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        nameLabel.textColor =  UIColor(red: 102/255,
                                           green: 102/255,
                                           blue: 102/255,
                                           alpha: 1)
        
        surnameLabel.text = "Фамилия"
        surnameLabel.textAlignment = .center
        surnameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        surnameLabel.textColor =  UIColor(red: 102/255,
                                           green: 102/255,
                                           blue: 102/255,
                                           alpha: 1)
        
        nameTextField.placeholder = "Имя"
        nameTextField.layer.borderColor = UIColor(red: 238/255,
                                              green: 238/255,
                                              blue: 238/255,
                                              alpha: 1).cgColor
        nameTextField.layer.borderWidth = 1.5
        nameTextField.layer.cornerRadius = 7
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        surnameTextField.placeholder = "Фамилия"
        surnameTextField.layer.borderColor = UIColor(red: 238/255,
                                              green: 238/255,
                                              blue: 238/255,
                                              alpha: 1).cgColor
        surnameTextField.layer.borderWidth = 1.5
        surnameTextField.layer.cornerRadius = 7
        surnameTextField.layer.masksToBounds = true
        surnameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 900)
        
        regButtonView.addSubview(regButton)
        [maleRButton, femaleRButton, loginLabel, passwordLabel, loginEdit, passwordEdit, repeatPasswordLabel, repeatPasswordEdit, regButtonView, nameLabel, surnameLabel, nameTextField, surnameTextField].forEach{formRegistrationView.addSubview($0)}
        
        [formRegistrationView, logoImageView, headLabel].forEach{ scrollView.addSubview($0)}
        
        view.addSubview(scrollView)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.pin
            .all(view.pin.safeArea)
        
        logoImageView.pin
            .top(50)
            .hCenter()
        
        headLabel.pin
            .below(of: logoImageView)
            .hCenter()
            .marginTop(5.0%)
            .sizeToFit()
        
        formRegistrationView.pin
            .horizontally(5.3%)
            .height(800)
            .below(of: headLabel).marginTop(4.5%)
        
        nameLabel.pin
            .top(5)
            .marginTop(20)
            .sizeToFit()
        
        nameTextField.pin
            .below(of: nameLabel)
            .marginTop(5)
            .height(40)
            .horizontally()
        
        surnameLabel.pin
            .below(of: nameTextField)
            .marginTop(20)
            .sizeToFit()
        
        surnameTextField.pin
            .below(of: surnameLabel)
            .marginTop(5)
            .height(40)
            .horizontally()
        
        maleRButton.pin
            .below(of: surnameTextField)
            .marginTop(10)
            .height(40)
            .width(46%)
            .horizontally()
            .left()
        femaleRButton.pin
            .below(of: surnameTextField)
            .marginTop(10)
            .height(40)
            .width(46%)
            .right()
        loginLabel.pin
            .below(of: maleRButton)
            .marginTop(20)
            .sizeToFit()
        loginEdit.pin
            .height(40)
            .horizontally()
            .below(of: loginLabel).marginTop(5)
        passwordLabel.pin.below(of: loginEdit).marginTop(20).sizeToFit()
        passwordEdit.pin
            .height(40)
            .horizontally()
            .below(of: passwordLabel).marginTop(5)
        repeatPasswordLabel.pin.below(of: passwordEdit).marginTop(20).sizeToFit()
        repeatPasswordEdit.pin
            .height(40)
            .horizontally()
            .below(of: repeatPasswordLabel).marginTop(5)
        regButtonView.pin
            .height(40)
            .horizontally()
            .below(of: repeatPasswordEdit).marginTop(30)
        regButton.pin
            .height(40)
            .horizontally()
    }
    
    @objc
    func didTapRadioButton(_ sender: UIButton) {
        if(sender == maleRButton && femaleRButton.layer.borderColor == UIColor.orange.cgColor)
        {
            sender.layer.borderColor = UIColor.orange.cgColor
            sender.layer.backgroundColor = UIColor.orange.cgColor
            sender.setTitleColor(.white, for: .normal)
            femaleRButton.layer.borderColor = UIColor.gray.cgColor
            femaleRButton.layer.backgroundColor = UIColor.white.cgColor
            femaleRButton.setTitleColor(.black, for: .normal)
        }
        else if (sender == femaleRButton && maleRButton.layer.borderColor == UIColor.orange.cgColor)
        {
            sender.layer.borderColor = UIColor.orange.cgColor
            sender.layer.backgroundColor = UIColor.orange.cgColor
            sender.setTitleColor(.white, for: .normal)
            maleRButton.layer.borderColor = UIColor.gray.cgColor
            maleRButton.layer.backgroundColor = UIColor.white.cgColor
            maleRButton.setTitleColor(.black, for: .normal)
        }
        sex = sender.currentTitle!
    }
    
    @objc
    func didTapRegButton() {
        guard let email = loginEdit.text, !email.isEmpty else {
            print("empty or not valid login")
            return
        }
        guard let password = passwordEdit.text, !password.isEmpty, password == repeatPasswordEdit.text else {
            print("empty or not valid password")
            return
        }
        guard let name = nameTextField.text, !name.isEmpty else {
            print("empty or not valid login")
            return
        }
        guard let surname = surnameTextField.text, !surname.isEmpty else {
            print("empty or not valid login")
            return
        }

        let user = UserData(uid: "", email: email, name: name, surname: surname, sex: sex)
        output.didTapRegButton(user: user, password: password)
    }
    
}

extension RegistrationViewController: RegistrationViewInput {
    
}
