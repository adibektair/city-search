//
//  Coordinator.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import Foundation
import UIKit

class Coordinator {
    
    var factory: Factory?
    var navigation: UINavigationController?
    
    func start() {
        navigation = UINavigationController()
        if let vc = factory?.getCitiesVC() {
            App.window?.rootViewController = navigation
            App.window?.makeKeyAndVisible()
            navigation?.setViewControllers([vc], animated: false)
        }
    }

    func openMap(with city: City) {
        if let mapVC = factory?.getMapScene(with: city) {
            mapVC.modalPresentationStyle = .popover
            navigation?.present(mapVC, animated: true, completion: nil)
        }
    }
}
