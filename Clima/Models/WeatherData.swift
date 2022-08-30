//
//  WeatherData.swift
//  Clima
//
//  Created by Muhammad Shayan on 30/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String?
    let main: Main?
    let weather: [Weather]?
}

struct Main: Decodable {
    let temp: Double?
}

struct Weather: Decodable {
    let description: String?
}
