//
//  MapPresenter.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import Foundation

typealias MapCoordinates = (latitude: Double, longitude: Double)

protocol MapViewProtocol {
    // For future expanding
}
protocol MapPresenterProtocol {
    func getCoordinates() -> MapCoordinates
}

class MapPresenter: MapPresenterProtocol {
    
    var view: MapViewProtocol
    var city: City
    
    init(view: MapViewProtocol, city: City) {
        self.view = view
        self.city = city
    }
    
    func getCoordinates() -> MapCoordinates {
        return (city.coord.lat, city.coord.lon)
    }
}
