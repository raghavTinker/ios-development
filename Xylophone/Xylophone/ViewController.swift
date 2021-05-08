//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBAction func keyPressed(_ sender: UIButton) {
        print("Key Pressed")
        let buttonPressed: String? = sender.currentTitle
        
        if let note = buttonPressed{
            playSound(note: note)
        }
        else{
            print("Something went wrong")
        }        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    //playing the sound
    func playSound(note: String){
        let sound = Bundle.main.url(forResource: note, withExtension: "wav")
        do{
            //Checking if the sound exists
            if let soundToPlay = sound{
                player = try AVAudioPlayer(contentsOf: soundToPlay,fileTypeHint: AVFileType.mp3.rawValue)
            }
            else{
                print("Error!")
            }
                    
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
}

