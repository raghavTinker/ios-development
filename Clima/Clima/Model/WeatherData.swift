//
//  WeatherData.swift
//  Clima
//
//  Created by Raghav Sharma on 15/05/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
    let id: Int
}

//For both encoding and decoding you can use the Codable protocol

