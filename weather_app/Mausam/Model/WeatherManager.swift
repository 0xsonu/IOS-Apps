//
//  WeatherManager.swift
//  Mausam
//
//  Created by Sonu Kumar on 05/11/24.
//  Copyright © 2024 0xsonu. All rights reserved.
//

import Foundation

struct WeatherManager {
    let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather?appid=<API_KEY>&units=metric"
    
    func fetchWeatherData(city: String){
        let url = "\(apiUrl)&q=\(city)"
        
        print(url)
    }
}
