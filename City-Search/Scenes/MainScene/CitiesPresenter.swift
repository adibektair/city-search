//
//  CitiesPresenter.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import Foundation
protocol CitiesViewProtocol {
    // For future expanding
}
protocol CitiesPresenterProtocol: AnyObject {
    var view: CitiesViewProtocol { get set }
    func filterCities(by char: String) -> [City]
    func getAllCities() -> [City]
    func showMap(_ city: City)
}

class CitiesPresenter: CitiesPresenterProtocol {
    
    var view: CitiesViewProtocol
    var coordinator: Coordinator?
    var cities: [City]
    
    init(view: CitiesViewProtocol, cities: [City]) {
        self.view = view
        self.cities = cities.sorted(by: { $0.name < $1.name })
    }

    func filterCities(by char: String) -> [City] {
        return cities.filter { city in
            city.name.starts(with: char)
        }
    }

    func getAllCities() -> [City] {
        return cities
    }

    func showMap(_ city: City) {
        coordinator?.openMap(with: city)
    }
}
