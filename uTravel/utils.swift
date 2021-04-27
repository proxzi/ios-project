//
//  utils.swift
//  uTravel
//
//  Created by Dmitry on 26.04.2021.
//

import UIKit

class Coordinator {
    static func rootVC(vc: UIViewController) {
        let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = vc
        sceneDelegate.window!.makeKeyAndVisible()
    }
}
