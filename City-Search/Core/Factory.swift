//
//  Factory.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import Foundation
import UIKit

class Factory {

    weak var coordinator: Coordinator?
    let citiesService = CitiesService.shared
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func getCitiesVC() -> CitiesVC {
        let citiesVC = CitiesVC.instantiate()
        var cities: [City] = []
        do {
            cities = try citiesService.readDataFromJson() ?? []
        } catch {
            print(error.localizedDescription)
        }
        let presenter = CitiesPresenter(view: citiesVC, cities: cities)
        presenter.coordinator = coordinator
        citiesVC.presenter = presenter
        return citiesVC
    }

    func getMapScene(with city: City) -> MapVC {
        let mapVC = MapVC.instantiate()
        let presenter = MapPresenter(view: mapVC, city: city)
        mapVC.presenter = presenter
        return mapVC
    }
}
