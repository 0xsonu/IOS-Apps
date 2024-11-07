//
//  WeatherManager.swift
//  Mausam
//
//  Created by Sonu Kumar on 05/11/24.
//  Copyright © 2024 0xsonu. All rights reserved.
//

import Foundation

struct WeatherManager {
    let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather?appid=32893633ae5f0c821d8ddc7e4e83a687&units=metric"
    
    func fetchWeatherData(city: String){
        let url = "\(apiUrl)&q=\(city)"
        print("Initiating Request on \(url)")
        performRequest(urlString: url)
    }
    
    
    // Network Call 4 step
    func performRequest(urlString: String){
        // 1. create URL
        if let url = URL(string: urlString){
            // 2. create URLSession
            let session = URLSession(configuration: .default)
            // 3. assign URLSession a task
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    let dataString = String(data: safeData, encoding: .utf8)
                    if let weather = self.parseData(weatherData: safeData) {
                        // send data to view
                    }
                    print(dataString!)
                }
            })
            // 4. start the task
            task.resume()
        }
        
        
    }
    
    func parseData(weatherData: Data) -> Weather?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = Weather(conditionId: decodedData.weather[0].id, cityName: decodedData.name, temperature: decodedData.main.temp)
            return weather
        } catch {
            print("Found Error: \(error)")
            return nil
        }
    }
    
    
    
    // replaced by clouser
//    func onCompletionHandler(data: Data?, response: URLResponse?, error: Error?){
//        if error != nil{
//            print(error!)
//            return
//        }
//        
//        if let safeData = data{
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString!)
//        }
//    }
}
