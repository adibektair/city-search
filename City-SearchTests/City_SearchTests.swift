//
//  City_SearchTests.swift
//  City-SearchTests
//
//  Created by tair on 26.03.22.
//

import XCTest
@testable import City_Search

class City_SearchTests: XCTestCase {

    func testSearch() {
        let citiesPresenter = CitiesPresenter(view: MockCityView(), cities: getMockCities())
        var result: [City] = citiesPresenter.filterCities(by: "A")
        XCTAssertEqual(result.count, 4)
        result = citiesPresenter.filterCities(by: "a")
        XCTAssertEqual(result.count, 4)
        result = citiesPresenter.filterCities(by: "al")
        XCTAssertEqual(result.count, 2)
        result = citiesPresenter.filterCities(by: "ala")
        XCTAssertEqual(result.count, 1)
        result = citiesPresenter.filterCities(by: "s")
        XCTAssertEqual(result.count, 1)
    }

    func getMockCities() -> [City] {
        let city = City(country: "US", name: "Alabama", _id: 1, coord: Coordinates(lon: 1.0, lat: 1.0))
        let city1 = City(country: "US", name: "Albuquerque", _id: 2, coord: Coordinates(lon: 1.0, lat: 1.0))
        let city2 = City(country: "US", name: "Anaheim", _id: 3, coord: Coordinates(lon: 1.0, lat: 1.0))
        let city3 = City(country: "US", name: "Arizona", _id: 4, coord: Coordinates(lon: 1.0, lat: 1.0))
        let city4 = City(country: "AU", name: "Sydney", _id: 5, coord: Coordinates(lon: 1.0, lat: 1.0))
        return [city, city1, city2, city3, city4]
    }
}
