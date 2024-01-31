//
//  File.swift
//  Clima
//
//  Created by R.AMOGH on 28/01/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2b8efbf4213dd1d9f8344d60288733d0&units=metric"
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString:urlString)
    }
    
    func performRequest(urlString:String){
        // Create a URL
        if let url = URL(string: urlString) {
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url){ (data,response,error) in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // Start the task
            task.resume()
        }

    }
    
    func parseJSON(weatherData:Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.conditionId)
            print(weather.temperatureString)
        }catch{
            print(error)
        }
    }
    


}
