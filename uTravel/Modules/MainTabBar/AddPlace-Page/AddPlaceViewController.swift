//
//  AddPlaceViewController.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import UIKit
import Cosmos
import PinLayout
import KMPlaceholderTextView

final class AddPlaceViewController: UIViewController {
	private let output: AddPlaceViewOutput

    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let titleTextField = UITextField() // выбрать место на карте
    private let headImageView = UIImageView()
    private let headIconImageView = UIImageView()
    private let ratingLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let starsView = UIView()
    private let descriptionTextView = KMPlaceholderTextView()
    private let classPlaceHeadLabel = UILabel()
    private let classPlaceTextField = UITextField()
    private let classPlaceToolBar = UIToolbar()
    
    
    private let classPlaces = ["Не выбрано", "Ресторан", "Музей", "Кафе", "Достопримечательность"]
    private let classPlacePickerView = UIPickerView()
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.rating = 5.0
        return view
    }()
    
    init(output: AddPlaceViewOutput) {
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
        
        //stackView
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(didTapAddBarButton))
        //navigationItem.rightBarButtonItem?.tintColor = .black
        classPlacePickerView.delegate = self
        classPlacePickerView.dataSource = self
        
        classPlaceToolBar.barStyle = UIBarStyle.default
        classPlaceToolBar.isTranslucent = true
        
        
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        
        classPlaceToolBar.setItems([doneButton], animated: false)
        classPlaceToolBar.isUserInteractionEnabled = true
        classPlaceTextField.inputAccessoryView = classPlaceToolBar
        
        cosmosView.didTouchCosmos = { rating in
            print("Rated: \(rating)")
        }
        print(cosmosView.rating)
        
        //headImageView.contentMode = .scaleAspectFill
        let gestureRecognizerImage = UITapGestureRecognizer(target: self, action: #selector(didTapHeadImageView))
        headIconImageView.image = UIImage(named: "download")
        headIconImageView.isUserInteractionEnabled = true
        headIconImageView.addGestureRecognizer(gestureRecognizerImage)
        
        headImageView.backgroundColor = .lightGray
        headImageView.isUserInteractionEnabled = true
        
        headImageView.addGestureRecognizer(gestureRecognizerImage)
        headImageView.layer.cornerRadius = 10
        headImageView.layer.masksToBounds = true
        
        
        titleLabel.text = "Название(место с карты)"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        titleLabel.textColor = .black
        
        ratingLabel.text = "Поставьте оценку:"
        ratingLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        ratingLabel.textColor = .black
        
        descriptionLabel.text = "Добавьте описание:"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        descriptionLabel.textColor = .black
        
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor(red: 255/255,
                                                        green: 125/255,
                                                        blue: 13/255,
                                                        alpha: 1).cgColor
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.masksToBounds = true
        descriptionTextView.placeholder = "Расскажите о месте..."
        descriptionTextView.placeholderColor = .gray
        descriptionTextView.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        classPlaceHeadLabel.text = "Категория места:"
        classPlaceHeadLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        classPlaceHeadLabel.textColor = .black
        
        classPlaceTextField.text = "Не выбрано"
        classPlaceTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        classPlaceTextField.textColor = .black
        classPlaceTextField.inputView = classPlacePickerView
        
        //classPlaceTextField.layer.borderWidth = 1
        classPlaceTextField.layer.cornerRadius = 7
        classPlaceTextField.layer.backgroundColor = UIColor(red: 255/255,
                                                      green: 125/255,
                                                      blue: 13/255,
                                                      alpha: 1).cgColor
        classPlaceTextField.textColor = .white
        classPlaceTextField.textAlignment = .center
        //classPlaceTextField.isUserInteractionEnabled = true
        classPlaceTextField.isEnabled = true
//        let gestureRecognizerclass = UITapGestureRecognizer(target: self, action: #selector(didTapHeadImageView))
        
        
//        femaleRButton.setTitle("Женщина", for: .normal)
//        femaleRButton.setTitleColor(.black, for: .normal)
//        femaleRButton.backgroundColor = .white
//        femaleRButton.layer.borderWidth = 1
//        femaleRButton.layer.borderColor = UIColor.gray.cgColor
//        femaleRButton.layer.cornerRadius = 7
//        femaleRButton.layer.masksToBounds = true
//        femaleRButton.addTarget(self, action: #selector(didTapRadioButton), for: .touchUpInside)
        
        headImageView.addSubview(headIconImageView)
        
        [cosmosView, headImageView, titleLabel, ratingLabel, descriptionLabel, descriptionTextView, classPlaceHeadLabel, classPlaceTextField].forEach{view.addSubview($0) }
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headImageView.pin
            .top(view.pin.safeArea + 10)
            .horizontally(10)
            .height(250)
        headIconImageView.pin
            .width(50)
            .height(50)
            .center()
        titleLabel.pin
            .below(of: headImageView)
            .marginTop(10)
            .sizeToFit()
            .left(10)
        ratingLabel.pin
            .below(of: titleLabel)
            .marginTop(10)
            .sizeToFit()
            .left(10)
        cosmosView.pin
            .below(of: ratingLabel)
            .left(10)
        classPlaceHeadLabel.pin
            .below(of: cosmosView)
            .left(10)
            .marginTop(10)
            .sizeToFit()
        classPlaceTextField.pin
            .below(of: classPlaceHeadLabel)
            .left(10)
            .marginTop(5)
            .width(150)
            .height(25)
        descriptionLabel.pin
            .below(of: classPlaceTextField)
            .marginTop(5)
            .sizeToFit()
            .left(10)
        descriptionTextView.pin
            .below(of: descriptionLabel)
            .marginTop(5)
            .horizontally(10)
            .bottom(view.pin.safeArea.bottom + 5)
        classPlaceToolBar.pin
            .sizeToFit()
    }
    
    @objc
    func didTapHeadImageView() {
        output.didTapHeadImageView()
    }
    
    @objc
    func didTapAddBarButton() {
        
    }
}

extension AddPlaceViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classPlaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classPlaces[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classPlaceTextField.text = classPlaces[row]
    }
    
    @objc func donePicker() {

        classPlaceTextField.resignFirstResponder()

    }
}


extension AddPlaceViewController: AddPlaceViewInput {
    func downloadHeadImage(image: UIImage?) {
        headIconImageView.isHidden = true
        headImageView.image = image
    }
}
