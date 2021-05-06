//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Raghav Sharma on 6/05/2021.
//  Copyright © 2019 London App Brewery. All rights reserved.
//  Learning With Angela Yu

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    let faceCollection: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    //the images above are actually
    //[#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"),........ so on]
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageViewOne.image = faceCollection[giveRandom()]
        diceImageViewTwo.image = faceCollection[giveRandom()]
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("roll the dice!")
        diceImageViewTwo.image = faceCollection[giveRandom()]
        diceImageViewOne.image = faceCollection[giveRandom()]
    }
    
    func giveRandom() -> Int{
        return Int.random(in: 0..<6)
    }
    
}

