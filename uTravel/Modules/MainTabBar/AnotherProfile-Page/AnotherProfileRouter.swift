//
//  AnotherProfileRouter.swift
//  uTravel
//
//  Created by Dmitry on 04.06.2021.
//  
//

import UIKit

final class AnotherProfileRouter {
    weak var viewController: UIViewController?
}

extension AnotherProfileRouter: AnotherProfileRouterInput {
    func openTravelDetail(trip: Trip, places: Array<Place>) {
        let container = TravelDetailContainer.assemble(with: TravelDetailContext(), trip: trip, places: places)
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
