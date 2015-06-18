//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Rehan Mahmood on 6/18/15.
//  Copyright (c) 2015 Sysnet Managed Services, Inc. All rights reserved.
//

import Foundation

//create lionCub which is a sub-class of Lion. Lion is a super-class of LionCub//
class LionCub: Lion{
    
    func rubLionCubsBelly (){
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar() {
        super.roar() //access the super class function
        println("LionCub: Growl Growl")

    }
    override func randomFact() -> String {
        var randomFactString: String
        if  isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks"
            
        }
        else {
            randomFactString = "Cubs begin eating meat at about age of six weeks"
        }
        return randomFactString
    }
}
//end sub class lionCub//