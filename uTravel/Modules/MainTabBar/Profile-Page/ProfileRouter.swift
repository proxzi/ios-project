//
//  ProfileRouter.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//  
//

import UIKit

final class ProfileRouter {
    weak var viewController: UIViewController?
}

extension ProfileRouter: ProfileRouterInput {
    
    func openProfileSettings() {
        let container = ProfileSettingsContainer.assemble(with: ProfileSettingsContext())
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openTravelDetail(with trip: Trip, and places: Array<Place>) {
        let container = TravelDetailContainer.assemble(with: TravelDetailContext(), trip: trip, places: places)
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}

