//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newQuestion()
        progressBar.progress = 0
    }
    
    
    //True or false pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        updateProgress()
        if let title = sender.currentTitle{
            print(title)
            
            if(quizBrain.check(userAnswer: title)){
                sender.backgroundColor = UIColor.green
                scoreLabel.text = "Score: \(quizBrain.getScore())"
            }
            else{
                sender.backgroundColor = UIColor.red
                scoreLabel.text = "Score: \(quizBrain.getScore())"
            }
        
        //Delay to show if the answer is correct
        trueButton.isEnabled = false
        falseButton.isEnabled = false
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(newQuestion), userInfo: nil, repeats: false)
    }
        else{
            print("Error")
        }
    }
    
    @objc func newQuestion(){
        //Button cleanup
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        //Getting new Question
        let q: String? = quizBrain.getQuestion()
        
        if let question = q{
            questionText.text = question
            trueButton.isEnabled = true
            falseButton.isEnabled = true
        }
        else{
            questionText.text = "Questions Over"
            trueButton.isEnabled = false
            falseButton.isEnabled = false
        }
    }
    
    func updateProgress(){
        //Progress bar update
        progressBar.progress = quizBrain.getProgress()
    }
    
}

