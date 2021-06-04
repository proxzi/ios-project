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
        let container = AddTravelContainer.assemble(with: AddTravelContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openTravelDetail(with trip: Trip, and places: Array<Place>) {
        let container = TravelDetailContainer.assemble(with: TravelDetailContext(), trip: trip, places: places)
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
}
