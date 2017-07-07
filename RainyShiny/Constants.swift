//
//  Constants.swift
//  RainyShiny
//
//  Created by baytoor on 7/5/17.
//  Copyright © 2017 Baytur. All rights reserved.
//

import Foundation

let data: String = "http://api.openweathermap.org/data/2.5/weather?"
let forecast: String = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let lat: String = "lat="
let lon: String = "&lon="
let appId = "&appid=bf4ca3586c2600d3f3be468b4a5aaeb7"
let latitude: Double = Location.sharedInstance.latitude
let longitude: Double = Location.sharedInstance.longitude

let current_Weather_Url = "\(data)\(lat)\(latitude)\(lon)\(longitude)\(appId)"
let Forecast_Url = "\(forecast)\(lat)\(latitude)\(lon)\(longitude)&cnt=10\(appId)"

typealias DownloadComplete = () -> ()

