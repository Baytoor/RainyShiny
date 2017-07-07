//
//  Location.swift
//  RainyShiny
//
//  Created by baytoor on 7/7/17.
//  Copyright © 2017 Baytur. All rights reserved.
//

import Foundation

class Location {
    static let sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
