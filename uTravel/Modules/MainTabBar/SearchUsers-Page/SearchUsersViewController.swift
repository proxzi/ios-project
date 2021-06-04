//
//  SearchUsersViewController.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class SearchUsersViewController: UIViewController {
	private let output: SearchUsersViewOutput

    
    
    private let collectionUserView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical

        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    private var users = Array<UserData>()
    
    private let scrollView = UIScrollView()
    
    init(output: SearchUsersViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.didLoadUserList()
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        collectionUserView.backgroundColor = .systemBackground
        collectionUserView.dataSource = self
        collectionUserView.delegate = self
        collectionUserView.register(SearchUsersCollectionViewUserCell.self, forCellWithReuseIdentifier: "SearchUsersCollectionViewUserCell")
        
        [collectionUserView].forEach{scrollView.addSubview($0)}
        
        view.addSubview(scrollView)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrollView.pin
            .all(view.pin.safeArea)
        collectionUserView.pin
            .top(10)
            .horizontally()
            .bottom(10)
    }
}

extension SearchUsersViewController: SearchUsersViewInput {
    func updateUserList(users: Array<UserData>) {
        self.users = users
        collectionUserView.reloadData()
    }
    
}

extension SearchUsersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchUsersCollectionViewUserCell", for: indexPath) as? SearchUsersCollectionViewUserCell else {
            return .init()
        }
        cell.configure(with: users[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
//        if indexPath.row == 0 {
//            output.didSelectItemCollection(index: idPlace)
//            idPlace += 1
//        }
//        else {
//            //output.didSelectItemCollection(place: AddTravelViewController.placesFromAddPlaceVC[indexPath.row - 1],index: indexPath.row)
//        }
        
        //output.didSelectItemCollection()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availableWidth = collectionView.bounds.width - 2
//        let sideLength = availableWidth
        
        return CGSize(width: 335, height: 132)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
