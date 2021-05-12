//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Raghav Sharma on 13/05/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) -> Int?{
        if height == 0{
            print("ERROR")
            return nil
        }
        else{
            let bmiV = weight/pow(height, 2)
            if bmiV < 18.5{
                print("underweight")
                bmi = BMI(value: weight/pow(height, 2), advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            }
            else if bmiV > 18.5 && bmiV < 24.9{
                print("normal")
                bmi = BMI(value: weight/pow(height, 2), advice: "Fit as a fiddle", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
            }
            else{
                print("overweight")
                bmi = BMI(value: weight/pow(height, 2), advice: "Eat less pies", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
            }
            
            return 0
        }
    }
    
    func getAdvice() -> String{
        if let bmi = self.bmi{
            return bmi.advice
        }
        else{
            return ""
        }
    }
    
    
    func getColor() -> UIColor{
        if let bmi = self.bmi{
            return bmi.color
            
        }
        else{
            return UIColor.blue
        }
    }
    
    func getBMIValue() -> String{
        if let bmi = self.bmi{
            return String(format: "%.2f", bmi.value)
        }
        else{
            return "0.0"
        }
        
    }
}
