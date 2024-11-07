//
//  WeatherModal.swift
//  Mausam
//
//  Created by Sonu Kumar on 07/11/24.
//  Copyright © 2024 0xsonu. All rights reserved.
//

import Foundation

struct Weather {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    // computedProperties
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    var wetherConditionIcon : String {
        switch conditionId {
        case 200...299:
            return "cloud.bolt"
        case 300...399:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.rain"
        case 600...699:
            return "cloud.snow"
        case 700...799:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
