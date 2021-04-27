//
//  MainViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class MainTabBarController: UITabBarController {
	private let output: MainTabBarControllerOutput

    init(output: MainTabBarControllerOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let exploreContainer = ExploreContainer.assemble(with: ExploreContext())
        let explorePage = UINavigationController(rootViewController: exploreContainer.viewController)
        explorePage.title = "Explore"
        
        let addTravelContainer = AddTravelContainer.assemble(with: AddTravelContext())
        let addTravelPage = UINavigationController(rootViewController: addTravelContainer.viewController)
        addTravelPage.title = "Add"

        let profileContainer = ProfileContainer.assemble(with: ProfileContext())
        let profilePage = UINavigationController(rootViewController: profileContainer.viewController)
        profilePage.title = "Profile"
        
        
        setViewControllers([explorePage, addTravelPage, profilePage], animated: true)
        
        self.tabBar.items?[0].image = UIImage(systemName: "pencil")
        self.tabBar.items?[1].image = UIImage(systemName: "plus")
        self.tabBar.items?[2].image = UIImage(systemName: "pencil")
        
//        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
//        myTabBarItem1.image = UIImage(systemName: "compass")
//        myTabBarItem1.selectedImage = UIImage(systemName: "compass")
//        myTabBarItem1.title = "Explore"
//        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
	}
}

extension MainTabBarController: MainTabBarControllerInput {
}
