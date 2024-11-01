//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sonu Kumar on 01/11/24.
//  Copyright © 2024 Sonu Kumar. All rights reserved.
//
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        let advice: String
        let color: UIColor
        if bmiValue < 18.5 {
            advice = "Underweight, Eat more pies!"
            color = .orange
        } else if bmiValue < 24.9 {
            advice = "Normal, You are fit!"
            color = .systemGreen
        } else {
            advice = "Overweight, Eat less pies!"
            color = .red
        }
        bmi = BMI(value: bmiValue, advice: advice, color: color  )
        
    }
    
    func getBmiValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .cyan
    }
    
    
}
