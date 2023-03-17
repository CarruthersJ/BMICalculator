//
//  ViewModel.swift
//  BMICalculator
//
//  Created by Carruthers, James (EJNR) on 17/03/2023.
//

import Foundation

class ViewModel {
    let bmiCalculator : BMICalculations = BMICalculations()
    
    func calculateBMI(weight: String, height: String, units: String) -> Double {
        var bmi = 0.0
        if let doubleOfWeight = Double(weight) {
            if let doubleOfHeight = Double(height) {
                bmi = bmiCalculator.calculateBmi(weight: doubleOfWeight, height: doubleOfHeight, units: units)
                bmi = bmi.removeExternalZeros()
            }
        }
        return bmi
    }
    
    func calculateClassification(bmi: Double) -> String {
        return bmiCalculator.lookUpBmiClassification(bmi: bmi)
    }
}
