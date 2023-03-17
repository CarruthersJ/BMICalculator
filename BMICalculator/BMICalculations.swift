//
//  BMICalculations.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation



class BMICalculations {
    func calculateBmi(weight: Double, height: Double, units : String) -> Double {
        var bmi : Double = 0.0
        if units == "metric" {
            let heightInMetres = height / 100
            let weightInKg = weight
            bmi = (weightInKg / (heightInMetres * heightInMetres)).rounded(toPlaces: 1)
        } else if units == "imperial" {
            bmi = ((weight / (height * height)) * 703).rounded(toPlaces: 1)
        }
        return bmi
    }
    
    func lookUpBmiClassification(bmi: Double) -> String {
        var classification: String = ""
        if bmi < 18.5 {
            classification = "Underweight"
            
        }
        if bmi >= 18.5 && bmi < 25 {
            classification = "Healthy"
        }
        if bmi >= 25 && bmi < 30 {
            classification = "Overweight"
        }
        if bmi >= 30 {
            classification = "Obese"
        }
        return classification
    }
}
