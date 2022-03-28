//
//  CitiesPresenter.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import Foundation
public protocol CitiesViewProtocol {
    // For future expanding
}
protocol CitiesPresenterProtocol: AnyObject {
    var view: CitiesViewProtocol { get set }
    func filterCities(by char: String) -> [City]
    func getAllCities() -> [City]
    func showMap(_ city: City)
}

public class CitiesPresenter: CitiesPresenterProtocol {
    
    var view: CitiesViewProtocol
    var coordinator: Coordinator?
    var cities: [City] = []
    var map: [String: [City]] = [:]
    
    init(view: CitiesViewProtocol, cities: [City]) {
        self.view = view
        setUpData(cities)
    }

    func filterCities(by char: String) -> [City] {
        let key = char.prefix(1).lowercased()
        if key.isEmpty {
            return cities
        }
        return map[key]?.filter { city in
            city.name.lowercased().starts(with: char.lowercased())
        } ?? []
    }

    func getAllCities() -> [City] {
        return cities
    }

    func showMap(_ city: City) {
        coordinator?.openMap(with: city)
    }
    
    private func setUpData(_ cities: [City]) {
        for city in cities {
            let key = city.name.prefix(1).lowercased()
            if map[key]?.isEmpty ?? true {
                map[key] = [city]
            } else {
                map[key]?.append(city)
            }
        }
        self.cities = cities.quicksort(comparison: { $0 < $1 })
        
    }
}

