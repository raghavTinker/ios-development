//
//  main.swift
//  Protocols
//
//  Created by Raghav Sharma on 14/05/21.
//

import Foundation

protocol CanFly{
    func fly()
}
class Bird{
    
    var isFemale = true
    
    func layEggs(){
        if isFemale{
            print("New bird made")
        }
    }
}

class Eagle: Bird, CanFly{
    
    func soar(){
        print("The eagle glides in the air using air currents")
    }
    func fly() {
        print("I fly")
    }
    
}

class Penguin: Bird{
    func swim(){
        print("Paddle through the water")
    }
}
let myEagle = Eagle()
myEagle.fly()
myEagle.layEggs()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.layEggs()
myPenguin.swim()
