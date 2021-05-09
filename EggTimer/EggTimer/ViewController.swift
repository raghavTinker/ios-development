//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressValue: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var stopButtonProp: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    let softTime: Int = 5
    let mediumtime: Int = 7
    let hardTime: Int = 12
    
    let eggTimes: [String: Int] = ["Hard": 12*60, "Soft": 5*60, "Medium" : 7*60]
    var secondsPassed: Int = 0
    var totalTime: Int = 0
    
    var timer = Timer()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        stopButtonProp.isEnabled = false
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //Invalidating any exisiting timer
        timer.invalidate()
        
        //Reset progress bar
        progressBar.progress = 0.0
        secondsPassed = 0
        
        //Button
        stopButtonProp.isEnabled = true
        stopButtonProp.setTitle("STOP", for: .normal)
        stopButtonProp.backgroundColor = .red
        stopButtonProp.setTitleColor(.white, for: .normal)
        
        //The chosen hardness
        var hardnessChosen: String = ""
        
        //Unwrapping, checking if the input is correct
        if let title = sender.currentTitle{
            hardnessChosen = title
        }
        else{
            print("Error")
        }
        
        titleLabel.text = hardnessChosen
        
        if let typeExists = eggTimes[hardnessChosen]{
            totalTime = typeExists
        }
        else{
            print("Error")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            progressValue.text = "Estimated time remaining: \((totalTime-secondsPassed)/60):\((totalTime-secondsPassed)%60)"
        }
        else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            progressValue.text = ""
            playAlarm()
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        progressValue.text = ""
        progressBar.progress = 0.0
        stopButtonProp.isEnabled = false
        stopButtonProp.setTitle("", for: .disabled)
        stopButtonProp.backgroundColor = .none
    }
    func playAlarm(){
        
        let sound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: sound!)
        player!.play()
    }
}

