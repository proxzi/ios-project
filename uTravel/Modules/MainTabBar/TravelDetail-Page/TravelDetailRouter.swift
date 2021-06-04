//
//  TravelDetailRouter.swift
//  uTravel
//
//  Created by Dmitry on 27.04.2021.
//  
//

import UIKit

final class TravelDetailRouter {
    weak var viewController: UIViewController?
}

extension TravelDetailRouter: TravelDetailRouterInput {
    func openPlaceDetail(place: Place) {
        let container = PlaceDetailContainer.assemble(with: PlaceDetailContext(), place: place)
        self.viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
