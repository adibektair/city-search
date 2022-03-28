//
//  CityServiceTest.swift
//  City-SearchTests
//
//  Created by tair on 28.03.22.
//

import XCTest

class CityServiceTest: XCTestCase {
    func testDataParsing() {
        let service = CitiesService()
        guard let _ = try? service.readDataFromJson() else {
            XCTFail("Error thrown")
            return
        }
    }
}
