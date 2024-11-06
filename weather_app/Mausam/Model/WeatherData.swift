//
//  WeatherDataModel.swift
//  Mausam
//
//  Created by Sonu Kumar on 06/11/24.
//  Copyright © 2024 0xsonu. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let id: Int
    let name: String
    let base: String
    let visibility: Int
    let cod: Int
    let dt: Int
    let timezone: Int
    let coord: Coord
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
    let sea_level: Double
    let grnd_level: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct Clouds: Codable {
    let all: Int
}

struct Wind : Codable {
    let speed: Double
    let deg: Double
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
