//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Rehan Mahmood on 5/28/15.
//  Copyright (c) 2015 Sysnet Managed Services, Inc. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    func chuff() {  // instance function that is called in an instance of the struct
        println("Tiger: Chuff Chuff")
    }
    func chuffNumberOfTimes(numberOfTimes: Int){
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff() //need self keyword to deconflict the func and var name conflict
        }
    }
    func chuffNumberOfTimes(numberOfTimes: Int, isLoud: Bool){ //adding an additional parameter makes it a different function
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud { //equivalent to isLoud == true
                chuff()
            } else {
                println("Tiger: purr purr")
            }
        }
    }
    func ageInTigerYearsFromAge(regularAge: Int) ->Int{
        let newAge = regularAge * 3
        return newAge //equivalent is return regularAge*3
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact: String
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        } else if(randomNumber == 1){
            randomFact = "Tigers an reach a length of 3.3 meters"
        } else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        
        return randomFact
    }
}