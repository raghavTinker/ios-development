//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var tip: Double = 0.0
    var numberOfPeople: Int = 2
    var totalAmt: Double = 0.0
    var finalResult: Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        unselectAllButtons()
        var buttonMinusPercent: String = ""
        let buttonPressed: String? = sender.currentTitle
        if buttonPressed != nil{
            buttonMinusPercent = String(buttonPressed?.dropLast() ?? "0.0")
            tip = (Double(buttonMinusPercent) ?? 0.0)/100
            
            if buttonPressed == "10%"{
                tenPctButton.isSelected = true
            }
            else if buttonPressed == "20%"{
                twentyPctButton.isSelected = true
            }
            else{
                zeroPctButton.isSelected = true
            }
            print(tip)
        }
        
        //Dismiss keyboard
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%d", Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let amt = billTextField.text{
            if amt.count <= 0{
                print("Enter valid value")
            }
            else{
                totalAmt = Double(amt) ?? 0.0
                print(totalAmt)
            }
        }
        else{
            print("ERROR")
        }
        
        //Calculate bill per person
        calculateSplit()
        
        //Go to the result VC
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func unselectAllButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func calculateSplit(){
        let tipAmount: Double = totalAmt * tip
        let totalAmountToBePaid: Double = tipAmount + totalAmt
        let split = totalAmountToBePaid / Double(numberOfPeople)
        print(split)
        finalResult = split
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destVC = segue.destination as! ResultsViewController
            
            destVC.result = String(finalResult)
            destVC.tip = Int(tip*100)
            destVC.split = numberOfPeople
        }
    }
    
}

