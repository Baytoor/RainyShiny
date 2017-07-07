//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by baytoor on 7/5/17.
//  Copyright © 2017 Baytur. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    private var _city: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var city:String{
        if _city == nil {
            return ""
        } else {
            return _city
        }
    }
    var date:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date

    }
    var weatherType:String{
        if _weatherType == nil {
            return ""
        } else {
            return _weatherType
        }
    }
    var currentTemp:Double{
        if _currentTemp == nil {
            return 0.0
        } else {
            return _currentTemp
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download 
        let currentWeatherUrl = URL(string: current_Weather_Url)!
        Alamofire.request(currentWeatherUrl, method:.get).responseJSON {response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let cityName = dict["name"] as? String{
                    self._city = cityName.capitalized
//                    print(self.city)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
//                        print(self.weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any>{
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = Double(round(10*(temp - 273.15)/10))
//                        print(self.currentTemp)
                    }
                }
            }
            completed()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
}
