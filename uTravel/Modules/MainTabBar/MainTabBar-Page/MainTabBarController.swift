//
//  MainViewController.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit
import SwiftSVG

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
        view.backgroundColor = .white
        
        let exploreContainer = ExploreContainer.assemble(with: ExploreContext())
        let explorePage = UINavigationController(rootViewController: exploreContainer.viewController)
        explorePage.title = "Исследовать"
        
//        let addTravelContainer = AddTravelContainer.assemble(with: AddTravelContext())
//        let addTravelPage = UINavigationController(rootViewController: addTravelContainer.viewController)
//        addTravelPage.title = "Добавить"
        
        let searchUsersContainer = SearchUsersContainer.assemble(with: SearchUsersContext())
        let searchUsersPage = UINavigationController(rootViewController: searchUsersContainer.viewController)
        searchUsersPage.title = "Поиск"
        
//        let chatContainer = ChatContainer.assemble(with: ChatContext())
//        let chatPage = UINavigationController(rootViewController: chatContainer.viewController)
//        chatPage.title = "Чат"

        let profileContainer = ProfileContainer.assemble(with: ProfileContext())
        let profilePage = UINavigationController(rootViewController: profileContainer.viewController)
        profilePage.title = "Профиль"
        
        
        setViewControllers([explorePage, searchUsersPage, profilePage], animated: true)
        
        self.tabBar.items?[0].image = UIImage(named: "airplane2")
        self.tabBar.items?[1].image = UIImage(named: "searchbar")
        self.tabBar.items?[2].image = UIImage(named: "profile")
//        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
//        myTabBarItem1.image = UIImage(systemName: "compass")
//        myTabBarItem1.selectedImage = UIImage(systemName: "compass")
//        myTabBarItem1.title = "Explore"
//        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
	}
}

extension MainTabBarController: MainTabBarControllerInput {
}
