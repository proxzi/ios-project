//
//  RegistrationViewController.swift
//  uTravel
//
//  Created by Dmitry on 20.04.2021.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension LoginViewController: RegistrationViewInput {

}
