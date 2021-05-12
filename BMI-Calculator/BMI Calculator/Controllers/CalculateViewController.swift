//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSliderProp: UISlider!
    @IBOutlet weak var weightSliderProp: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    var weight: Float = 0.0
    var height: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSliderProp.value = 3/2
        weightSliderProp.value = 200/2
        heightLabel.text = String(format: "%.1fm", heightSliderProp.value)
        weightLabel.text = String(format: "%.1fkg", weightSliderProp.value)
        
        height = 3/2
        weight = 200/2
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.textColor = .black
        heightLabel.text = String(format: "%.1fm", sender.value)
        height = sender.value
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1fkg", sender.value)
        weight = sender.value
    }
    @IBAction func calculate(_ sender: Any) {
        let possible: Int? = calculatorBrain.calculateBMI(height: height, weight: weight)
        if possible != nil{
            heightLabel.textColor = .black
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        else{
            print("Division by 0")
            heightLabel.textColor = .red
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC: ResultViewController = segue.destination as! ResultViewController
            destinationVC.calculatorBrain = calculatorBrain
        }
    }
}

