//
//  RegistrationViewController.swift
//  uTravel
//
//  Created by Dmitry on 20.04.2021.
//

import UIKit
import PinLayout

final class RegistrationViewController: UIViewController {
    private let output: RegistrationViewOutput

    
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
    private var sex = String()
    
    init(output: RegistrationViewOutput) {
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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        headLabel.text = "Регистрация"
        headLabel.textAlignment = .center
        headLabel.font = UIFont.systemFont(ofSize: 38, weight: .regular)
        
        loginLabel.text = "Логин"
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
        maleRButton.setTitleColor(.black, for: .normal)
        maleRButton.backgroundColor = .white
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
        
        loginEdit.placeholder = "Логин"
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
        
        
        
        regButtonView.addSubview(regButton)
        [maleRButton, femaleRButton, loginLabel, passwordLabel, loginEdit, passwordEdit, repeatPasswordLabel, repeatPasswordEdit, regButtonView].forEach{formRegistrationView.addSubview($0)}
        
        [formRegistrationView, logoImageView, headLabel].forEach{ view.addSubview($0)}
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logoImageView.pin.top(12.1%).hCenter()
        headLabel.pin
            .below(of: logoImageView).hCenter()
            .marginTop(8.7%).sizeToFit()
        
        formRegistrationView.pin
            .horizontally(5.3%)
            .height(100%)
            .below(of: headLabel).marginTop(5.7%)
        maleRButton.pin
            .height(40)
            .width(46%)
            .horizontally()
            .topLeft()
        femaleRButton.pin
            .height(40)
            .width(46%)
            .topRight()
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
            .below(of: repeatPasswordEdit).marginTop(16)
        regButton.pin
            .height(40)
            .horizontally()
    }
    @objc func didTapRadioButton(_ sender: UIButton) {
        if(sender == maleRButton && femaleRButton.layer.borderColor == UIColor.orange.cgColor)
        {
            sender.layer.borderColor = UIColor.orange.cgColor
            femaleRButton.layer.borderColor = UIColor.gray.cgColor
        }
        else if (sender == femaleRButton && maleRButton.layer.borderColor == UIColor.orange.cgColor)
        {
            sender.layer.borderColor = UIColor.orange.cgColor
            maleRButton.layer.borderColor = UIColor.gray.cgColor
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
        output.didTapRegButton(email: email, password: password)
    }
}

extension LoginViewController: RegistrationViewInput {

}

