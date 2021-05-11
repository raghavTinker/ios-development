//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Raghav Sharma on 10/05/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct QuizBrain{
    let quiz: [Question] = [
        Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    //Question number
    var q_no: Int = 0
    
    //index in quiz that are done
    var questionsDone: [Int] = []
    
    //Temporary Quiz array (editable)
    var quizTemp: [Question]
    
    init(){
        self.quizTemp = quiz
    }
    
    //Score
    var score: Int = 0
    
    mutating func check(userAnswer: String) -> Bool{
        if (q_no >= quizTemp.count){
            return false
        }
        if(userAnswer == quizTemp[q_no].answer){
            print("Great! Correct Answer")
            
            //Removing question from the array
            quizTemp.remove(at: q_no)
            score += 1
            return true
        }
        else{
            //Wrong
            print("Wrong Answer!")
            
            //Removing question from the array
            quizTemp.remove(at: q_no)
            score -= 1
            return false
        }
    }
    
    mutating func getQuestion() -> String?{
        if(questionsDone.count < quiz.count){
            let index: Int = Int.random(in: 0..<quizTemp.count)
            self.q_no = index
            self.questionsDone.append(index)
            return quizTemp[index].text
        }
        else{
            return nil
        }
    }
    
    func getProgress() -> Float{
        return Float(questionsDone.count+1) / Float(quiz.count)
    }
    
    mutating func restoreQuiz(){
        self.quizTemp = quiz
    }
    
    func getScore() -> Int{
        return self.score
    }
}
