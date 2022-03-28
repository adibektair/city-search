//
//  CityModel.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import Foundation

public struct City: Decodable {
    var displayTitle: String {
        return name + ", " + country
    }
    var displaySubtitle: String {
        return "\(coord.lat), \(coord.lon)"
    }
    var country: String
    var name: String
    var _id: Int
    var coord: Coordinates
}

struct Coordinates: Decodable {
    var lon: Double
    var lat: Double
}
