//
//  Double.swift
//  BMICalculator
//
//  Created by Cormell, David - DPC on 24/02/2022.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func removeExternalZeros() -> Double {
        var passedDecimals = false
        var returnNumberString = ""
        var returnNumberDouble = 0.0
        let stringNumber = String(self)
        for char in stringNumber {
            if char == "." {
                passedDecimals = true
            }
            
            if passedDecimals == false {
                returnNumberString += String(char)
            } else if char != "0" {
                returnNumberString += String(char)
            }
            
        }
        if let doubleToReturn = Double(returnNumberString) {
            returnNumberDouble = doubleToReturn
        }
        return returnNumberDouble
    }
}
