//
//  WeatherData.swift
//  Clima
//
//  Created by R.AMOGH on 31/01/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

// The property names must match the names in the JSON
// data precisely.

struct WeatherData : Decodable{
    let name: String
    let main: Main
    let weather:[Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
    let id: Int
}
