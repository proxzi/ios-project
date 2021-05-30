//
//  AddTravelViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import PinLayout

final class AddTravelViewController: UIViewController {
	private let output: AddTravelViewOutput

    private let headIconImageView = UIImageView()
    private let headImageView = UIImageView()
    private let titleTextField = UITextField()
    private let locationLabel = UILabel()
    private let seasonTextField = UITextField()
    private let dateTextField = UITextField()
    private let seasonToolBar = UIToolbar()
    
    private let seasons = ["Не выбрано", "Зима", "Весна", "Лето", "Осень"]
    private let seasonPickerView = UIPickerView()
    
    
    private let collectionPlaceView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal

        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    init(output: AddTravelViewOutput) {
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
        
        collectionPlaceView.backgroundColor = .systemBackground
        collectionPlaceView.dataSource = self
        collectionPlaceView.delegate = self
        collectionPlaceView.register(AddTravelCollectionViewPlaceCell.self, forCellWithReuseIdentifier: "AddTravelCollectionViewPlaceCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Далее", style: .plain, target: self, action: #selector(didTapDoneBarButton))
        
        seasonPickerView.delegate = self
        seasonPickerView.dataSource = self
        
        seasonToolBar.barStyle = UIBarStyle.default
        seasonToolBar.isTranslucent = true
        
        
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        
        seasonToolBar.setItems([doneButton], animated: false)
        seasonToolBar.isUserInteractionEnabled = true
        seasonTextField.inputAccessoryView = seasonToolBar
        
        
        let gestureRecognizerImage = UITapGestureRecognizer(target: self, action: #selector(didTapHeadImageView))
        
        headIconImageView.image = UIImage(named: "download")
        headIconImageView.isUserInteractionEnabled = true
        headIconImageView.addGestureRecognizer(gestureRecognizerImage)
        
        headImageView.backgroundColor = .lightGray
        headImageView.isUserInteractionEnabled = true
        
        headImageView.addGestureRecognizer(gestureRecognizerImage)
        headImageView.layer.cornerRadius = 10
        headImageView.layer.masksToBounds = true
        
        titleTextField.placeholder = "Название..."
        titleTextField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleTextField.textColor = .black
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.cornerRadius = 5
        titleTextField.layer.masksToBounds = true
        titleTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        let gestureRecognizerLocal = UITapGestureRecognizer(target: self, action: #selector(didTapLocationLabel))
        
        locationLabel.text = "Добавить город"
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        locationLabel.textColor = .black
        locationLabel.addGestureRecognizer(gestureRecognizerLocal)
        locationLabel.isUserInteractionEnabled = true
        
        seasonTextField.placeholder = "Cезон поездки..."
        seasonTextField.text = "Не выбрано"
        seasonTextField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        seasonTextField.textColor = .black
        seasonTextField.layer.borderWidth = 1
        seasonTextField.layer.cornerRadius = 5
        seasonTextField.layer.masksToBounds = true
        seasonTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        seasonTextField.inputView = seasonPickerView
        
        dateTextField.placeholder = "Кол-во дней..."
        dateTextField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        dateTextField.textColor = .black
        dateTextField.layer.borderWidth = 1
        dateTextField.layer.cornerRadius = 5
        dateTextField.layer.masksToBounds = true
        dateTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
        headImageView.addSubview(headIconImageView)
        
        [headImageView, titleTextField, locationLabel, seasonTextField, dateTextField, collectionPlaceView].forEach{view.addSubview($0) }
        
	}
    
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
        titleTextField.pin
            .below(of: headImageView)
            .marginTop(10)
            .horizontally(10)
            .height(25)
        locationLabel.pin
            .below(of: titleTextField)
            .marginTop(10)
            .horizontally(10)
            .height(20)
        seasonTextField.pin
            .below(of: locationLabel)
            .marginTop(10)
            .horizontally(10)
            .height(25)
        dateTextField.pin
            .below(of: seasonTextField)
            .marginTop(10)
            .horizontally(10)
            .height(25)
        seasonToolBar.pin
            .sizeToFit()
        collectionPlaceView.pin
            .below(of: dateTextField)
            .marginTop(10)
            .horizontally(10)
            .height(70)
    }
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    @objc
    func didTapDoneBarButton() {
        let places: [Place]
//        let travel = Travel(title: titleTextField.text, image: headImageView, location: <#T##String#>, season: <#T##String#>, date: <#T##String#>, price: <#T##String#>, places: <#T##[Place]#>)
        
        //output.didTapDoneBarButton()
    }
    
    @objc
    func didTapHeadImageView() {
        output.didTapHeadImageView()
    }
    
    @objc
    func didTapLocationLabel() {
        output.didTapLocationLabel()
    }
}


extension AddTravelViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seasons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return seasons[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seasonTextField.text = seasons[row]
    }
    
    @objc func donePicker() {

        seasonTextField.resignFirstResponder()

    }
    
}

extension AddTravelViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddTravelCollectionViewPlaceCell", for: indexPath) as? AddTravelCollectionViewPlaceCell else {
            return .init()
        }
        if indexPath.row == 0 {
            cell.configure(with: "plus")
        }
        else {
            cell.configure(with: "sea")
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        output.didSelectItemCollection(index: indexPath.row)
        //output.didSelectItemCollection()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availableWidth = collectionView.bounds.width - 2
//        let sideLength = availableWidth
        
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}


extension AddTravelViewController: AddTravelViewInput {
    func downloadHeadImage(image: UIImage?) {
        headIconImageView.isHidden = true
        headImageView.image = image
    }
}
