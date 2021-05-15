//
//  WeatherModel.swift
//  Clima
//
//  Created by Raghav Sharma on 15/05/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch conditionID{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
