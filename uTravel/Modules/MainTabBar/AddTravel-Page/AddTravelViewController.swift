//
//  AddTravelViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import PinLayout
import Firebase
import KMPlaceholderTextView

final class AddTravelViewController: UIViewController {
	private let output: AddTravelViewOutput

    private let headIconImageView = UIImageView()
    private let headImageView = UIImageView()
    private let titleTextField = UITextField()
    private let locationLabel = UILabel()
    private let seasonTextField = UITextField()
    private let dateTextField = UITextField()
    private let seasonToolBar = UIToolbar()
    private let priceTextField = UITextField()
    
    private let descriptionLabel = UILabel()
    private let descriptionTextView = KMPlaceholderTextView()
    
    static var textLocation = ""
    static var placesFromAddPlaceVC = Array<Place>()
    private var idPlace = 0
    
    
    private var places = Array<Place>()
    
    private let loadingVC = LoadingViewController()

    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        output.didloadPlaces()
        collectionPlaceView.reloadData()
        locationLabel.text = AddTravelViewController.textLocation
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        //AddTravelViewController.placesFromAddPlaceVC.removeAll()
    }
	override func viewDidLoad() {
		super.viewDidLoad()

        view.backgroundColor = .white
        
        collectionPlaceView.backgroundColor = .systemBackground
        collectionPlaceView.dataSource = self
        collectionPlaceView.delegate = self
        collectionPlaceView.register(AddTravelCollectionViewPlaceCell.self, forCellWithReuseIdentifier: "AddTravelCollectionViewPlaceCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(didTapDoneBarButton))
        
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
        
        AddTravelViewController.textLocation = locationLabel.text!
        
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
        
        priceTextField.placeholder = "Стоимость поездки..."
        priceTextField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        priceTextField.textColor = .black
        priceTextField.layer.borderWidth = 1
        priceTextField.layer.cornerRadius = 5
        priceTextField.layer.masksToBounds = true
        priceTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0);
        
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
        descriptionTextView.placeholder = "Расскажите о поездке..."
        descriptionTextView.placeholderColor = .gray
        descriptionTextView.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        headImageView.addSubview(headIconImageView)
        
        [headImageView, titleTextField, locationLabel, seasonTextField, dateTextField, collectionPlaceView, priceTextField, descriptionLabel, descriptionTextView].forEach{view.addSubview($0) }
        
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
        priceTextField.pin
            .below(of: dateTextField)
            .marginTop(10)
            .horizontally(10)
            .height(25)
        seasonToolBar.pin
            .sizeToFit()
        collectionPlaceView.pin
            .below(of: priceTextField)
            .marginTop(10)
            .horizontally(10)
            .height(70)
        
        descriptionLabel.pin
            .below(of: collectionPlaceView)
            .marginTop(5)
            .sizeToFit()
            .left(10)
        descriptionTextView.pin
            .below(of: descriptionLabel)
            .marginTop(5)
            .horizontally(10)
            .bottom(view.pin.safeArea.bottom + 5)
    }
    private let imageLoader: ImageLoaderDescription = ImageLoader.shared
    @objc
    func didTapDoneBarButton() {
        guard let currentUser = Auth.auth().currentUser else {
            print("empty or not valid user")
            return
        }
        let user = User(user: currentUser)
        
        guard let title = titleTextField.text, !title.isEmpty else {
            print("empty or not valid title")
            return
        }
        guard let image = headImageView.image else {
            print("not image")
            return
        }
        guard let location = locationLabel.text, !location.isEmpty else {
            print("empty or not valid location")
            return
        }
        guard let season = seasonTextField.text, !season.isEmpty else {
            print("empty or not valid season")
            return
        }
        guard let date = dateTextField.text, !date.isEmpty else {
            print("empty or not valid date")
            return
        }
        guard let price = priceTextField.text, !price.isEmpty else {
            print("empty or not valid price")
            return
        }
        
        let trip = Trip(title: title, image: image, location: location, season: season, date: date, price: price, userId: user.uid)
        
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve
        present(loadingVC, animated: true, completion: nil)
        places = AddTravelViewController.placesFromAddPlaceVC
        AddTravelViewController.placesFromAddPlaceVC.removeAll()
        output.didTapDoneBarButton(trip: trip, places: self.places)
    }
    
    @objc
    func didTapHeadImageView() {
        output.didTapHeadImageView()
    }
    
    @objc
    func didTapLocationLabel() {
        output.didTapLocationLabel(location: locationLabel.text!)
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
        return AddTravelViewController.placesFromAddPlaceVC.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddTravelCollectionViewPlaceCell", for: indexPath) as? AddTravelCollectionViewPlaceCell else {
            return .init()
        }
        if indexPath.row == 0 {
            cell.configure(with: "plus")
        }
        else {
            cell.configure(with: AddTravelViewController.placesFromAddPlaceVC[indexPath.row - 1])
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath.row == 0 {
            output.didSelectItemCollection(index: idPlace)
            idPlace += 1
        }
        else {
            //output.didSelectItemCollection(place: AddTravelViewController.placesFromAddPlaceVC[indexPath.row - 1],index: indexPath.row)
        }
        
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
    func reloadData(place: Place, index: Int) {
//        if index < places.count {
//            places[index] = place
//            collectionPlaceView.reloadData()
//        }
    }
    
    func loadedPlaces(places: Array<Place>) {
//        self.places = places
//        collectionPlaceView.reloadData()
    }
    
    func didSuccessfulSaveData() {
        loadingVC.navigationController?.popViewController(animated: true)
        loadingVC.dismiss(animated: true, completion: nil)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    
    func downloadHeadImage(image: UIImage?) {
        headIconImageView.isHidden = true
        headImageView.image = image
    }
}
