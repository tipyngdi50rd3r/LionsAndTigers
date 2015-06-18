//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Rehan Mahmood on 6/2/15.
//  Copyright (c) 2015 Sysnet Managed Services, Inc. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""
    
    func roar() {
        println("Lion: Roar Roar")
    }
    func changeToAlphaMale() {
        self.isAlphaMale = true
    }
    func randomFact() -> String{
        var randomFact: String
        if self.isAlphaMale {
            randomFact = "Male lions are easy to recognize thannks to their distinctive manes. Males with darker manes are more likely to attrack females."
        }
        else {
            randomFact = "Female lionesses form the stable social unit and do not tolerate outside females"
        }
        return randomFact
    }
}