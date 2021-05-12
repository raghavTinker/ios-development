//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Raghav Sharma on 12/05/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var calculatorBrain: CalculatorBrain?
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let brain = calculatorBrain{
            bmiLabel.text = brain.getBMIValue()
            print(brain)
            
            //give advice
            adviceLabel.text = brain.getAdvice()
            view.backgroundColor = brain.getColor()
        }
        else{
            bmiLabel.text = "Error"
        }
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
