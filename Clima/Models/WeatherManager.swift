//
//  WeatherManager.swift
//  Clima
//
//  Created by Muhammad Shayan on 28/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=75fabbbdcc387332a5f584df6e0d95f2&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL:
        if let url = URL(string: urlString) {
            // 2. Create URLSession.
            let session = URLSession(configuration: .default)
            // 3. Give the session a task.
            let task = session.dataTask(with: url) { data, respone, error in
                if let error = error {
                    print(error)
                    return
                }
                if let data = data {
                    self.parseJSON(weatherData: data)
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather?.first?.description)
        } catch {
            print(error)
        }
    }
}
