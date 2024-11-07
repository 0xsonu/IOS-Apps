//
//  WeatherManager.swift
//  Mausam
//
//  Created by Sonu Kumar on 05/11/24.
//  Copyright © 2024 0xsonu. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: Weather)
    func didFailedWithError(_ error: Error)
}

struct WeatherManager {
    let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather?appid=32893633ae5f0c821d8ddc7e4e83a687&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeatherData(for city: String){
        let url = "\(apiUrl)&q=\(city)"
        print("Initiating Request on \(url)")
        performRequest(with: url)
    }
    
    func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let url = "\(apiUrl)&lat=\(latitude)&lon=\(longitude)"
        print("Initiating Request on \(url)")
        performRequest(with: url)
    }
    
    
    
    // Network Call 4 step
    func performRequest(with urlString: String){
        // 1. create URL
        if let url = URL(string: urlString){
            // 2. create URLSession
            let session = URLSession(configuration: .default)
            // 3. assign URLSession a task
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailedWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseData(safeData) {
                        // send data to view
                        // use delegate pattern
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            })
            // 4. start the task
            task.resume()
        }
        
        
    }
    
    func parseData(_ weatherData: Data) -> Weather?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = Weather(conditionId: decodedData.weather[0].id, cityName: decodedData.name, temperature: decodedData.main.temp)
            return weather
        } catch {
            delegate?.didFailedWithError(error)
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
