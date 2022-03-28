//
//  CitiesService.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import Foundation

final public class CitiesService {
    
    static let fileName = "cities"
    @Singleton static var shared = CitiesService()
    
    func readDataFromJson() throws -> [City]? {
        if let url = Bundle.main.url(forResource: CitiesService.fileName, withExtension: "json") {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([City].self, from: data)
            return jsonData
        }
        return nil
    }
}
