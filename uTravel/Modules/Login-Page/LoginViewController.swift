//
//  LoginViewController.swift
//  uTravel
//
//  Created by Dmitry on 19.04.2021.
//  
//

import UIKit
import PinLayout

final class LoginViewController: UIViewController {
	private let output: LoginViewOutput
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let loginButton = UIButton()
    private let headLabel = UILabel()
    
    private let containerLogPassView = UIView()
    
    private let loginLabel = UILabel()
    private let loginEdit = UITextField()
    private let passwordLabel = UILabel()
    private let passwordEdit = UITextField()
    private let forgotLabel = UILabel()
    private let signUpLabel = UILabel()
    private let loginButtonView = UIView()
    
    init(output: LoginViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
        headLabel.text = "Вход"
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
        loginEdit.placeholder = "Логин"
        passwordEdit.placeholder = "Пароль"
        
        forgotLabel.text = "Забыли пароль?"
        forgotLabel.textAlignment = .center
        forgotLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        forgotLabel.textColor = UIColor(red: 255/255,
                                       green: 125/255,
                                       blue: 13/255,
                                       alpha: 1)
        
        signUpLabel.text = "Зарегистрироваться"
        signUpLabel.textAlignment = .center
        signUpLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        signUpLabel.textColor = UIColor(red: 255/255,
                                        green: 125/255,
                                        blue: 13/255,
                                        alpha: 1)
       
        
        loginEdit.layer.borderColor = UIColor(red: 238/255,
                                              green: 238/255,
                                              blue: 238/255,
                                              alpha: 1).cgColor
        loginEdit.layer.borderWidth = 1.5
        loginEdit.layer.cornerRadius = 7
        loginEdit.layer.masksToBounds = true
        loginEdit.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        
        passwordEdit.layer.borderColor = UIColor(red: 238/255,
                                                 green: 238/255,
                                                 blue: 238/255,
                                                 alpha: 1).cgColor
        passwordEdit.layer.borderWidth = 1.5
        passwordEdit.layer.cornerRadius = 7
        passwordEdit.layer.masksToBounds = true
        passwordEdit.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        loginButton.setTitle("Войти", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginButton.layer.cornerRadius = 7
        loginButton.layer.masksToBounds = true
        loginButton.backgroundColor = UIColor(red: 255/255,
                                              green: 125/255,
                                              blue: 13/255,
                                              alpha: 1)
        
        
        loginButtonView.layer.shadowColor = UIColor(red: 255/255,
                                               green: 209/255,
                                               blue: 170/255,
                                               alpha: 1).cgColor
        loginButtonView.layer.shadowRadius = 4
        loginButtonView.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginButtonView.layer.shadowOpacity = 0.8
        loginButtonView.isUserInteractionEnabled = true
        view.backgroundColor = .white
        
        containerLogPassView.isUserInteractionEnabled = true
        loginButtonView.addSubview(loginButton)
        
        [loginLabel, loginEdit, passwordLabel, passwordEdit, loginButtonView, forgotLabel, signUpLabel].forEach{containerLogPassView.addSubview($0)}
        
        [containerLogPassView, logoImageView, headLabel].forEach{ view.addSubview($0)}
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        logoImageView.pin.top(12.1%).hCenter()
        headLabel.pin
            .below(of: logoImageView).hCenter()
            .marginTop(8.7%).sizeToFit()

        containerLogPassView.pin
            .horizontally(5.3%)
            .height(100%)
            .below(of: headLabel).marginTop(5.7%)
        
        loginLabel.pin.topLeft().sizeToFit()
        loginEdit.pin
            .height(40)
            .horizontally()
            .below(of: loginLabel).marginTop(5)
        passwordLabel.pin.below(of: loginEdit).marginTop(20).sizeToFit()
        passwordEdit.pin
            .height(40)
            .horizontally()
            .below(of: passwordLabel).marginTop(5)
        
        forgotLabel.pin.below(of: passwordEdit).marginTop(28).sizeToFit().hCenter()
        loginButtonView.pin
            .height(40)
            .horizontally()
            .below(of: forgotLabel).marginTop(16)
        signUpLabel.pin.below(of: loginButton).marginTop(17).sizeToFit().hCenter()
        loginButton.pin
            .height(40)
            .horizontally()
            .below(of: forgotLabel).marginTop(16)
        signUpLabel.pin.below(of: loginButton).marginTop(17).sizeToFit().hCenter()
        

    }
    @objc
    private func didTapLoginButton() {
        output.didTapLoginButton()
    }
}

extension LoginViewController: LoginViewInput {
}
