//
//  LocationTests.swift
//  project04-TodoTDDTests
//
//  Created by 박성민 on 2021/04/09.
//

import XCTest
import CoreLocation
@testable import project04_TodoTDD

class LocationTests: XCTestCase {
    let locationName = "LocationName"
   
    func test_init_Name() {
        
        let location = Location(name: locationName)
        
        XCTAssertEqual(locationName, location.name)
    }
    
    func test_init_Coordinate() {
        let latitude = 5.0
        let longitude = 10.0
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = Location(name: locationName, coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, latitude)
        XCTAssertEqual(location.coordinate?.longitude, longitude)
        
    }
    

}
