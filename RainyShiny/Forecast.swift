//
//  Forecast.swift
//  RainyShiny
//
//  Created by baytoor on 7/7/17.
//  Copyright © 2017 Baytur. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: Double!
    private var _lowTemp: Double!
    
    var date: String{
        return _date
        
    }
    var weatherType: String{
        if _weatherType == nil {
            return ""
        } else {
            return _weatherType
        }
    }
    var highTemp: Double{
        if _highTemp == nil {
            return 0.0
        } else {
            return _highTemp
        }
    }
    var lowTemp: Double{
        if _lowTemp == nil {
            return 0.0
        } else {
            return _lowTemp
        }
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String,Any> {
            
            if let min = temp["min"] as? Double {
                self._lowTemp = Double(round(10*(min - 273.15)/10))
            }
            if let max = temp["max"] as? Double {
                self._highTemp = Double(round(10*(max - 273.15)/10))
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,Any>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
    } 
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}








