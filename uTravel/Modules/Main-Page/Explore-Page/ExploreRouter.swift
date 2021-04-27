//
//  ExploreRouter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ExploreRouter {
    weak var viewController: UIViewController?
}

extension ExploreRouter: ExploreRouterInput {
    func openAddTravel() {
        
    }
    
    func openTravelDetail() {
        let container = TravelDetailContainer.assemble(with: TravelDetailContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
}
