//
//  CityModel.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import Foundation

public struct City: Decodable, Comparable, Equatable {
    
    
    
    
    var displayTitle: String {
        return name + ", " + country
    }
    var displaySubtitle: String {
        return "\(coord.lat), \(coord.lon)"
    }
    var country: String
    public var name: String
    var _id: Int
    var coord: Coordinates
    
    public static func < (lhs: City, rhs: City) -> Bool {
        return lhs.name < rhs.name
    }
    public static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Coordinates: Decodable {
    var lon: Double
    var lat: Double
}
