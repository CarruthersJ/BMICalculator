//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var calculatedBMI : Double = 0.0
    @State private var calculatedClassification : String = ""
    @State private var calculated : Bool = false
    @State private var units : String = "metric"
    
    let model = ViewModel()
    
    var body: some View {
        
        Button("Swap units") {
            if units == "metric" {
                units = "imperial"
            } else if units == "imperial" {
                units = "metric"
            }
        }
        Form {
            
            Section {
                Image("PublicHealth")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Section {
                VStack {
                    Text("Units are in \(units)")
                    Divider()
                    if units == "metric" {
                        TextField("Enter your height in cm", text: $height)
                        Divider()
                        TextField("Enter your weight in kg", text: $weight)
                    } else if units == "imperial" {
                        TextField("Enter your height in inches", text: $height)
                        Divider()
                        TextField("Enter your weight in pounds", text: $weight)
                    }
                }
            }
            Section {
                if calculated == true {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Your BMI is:")
                            Text("\(calculatedBMI)")
                        }
                        HStack {
                        
                            Text("You are")
                            Text("\(calculatedClassification)")
                            }
                        }
                }
                
                }
            }
        Button("Calculate BMI") {
            calculatedBMI = model.calculateBMI(weight: weight, height: height, units: units)
            calculatedClassification = model.calculateClassification(bmi: calculatedBMI)
            calculated = true
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
