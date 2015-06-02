//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Rehan Mahmood on 5/28/15.
//  Copyright (c) 2015 Sysnet Managed Services, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//properties
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    
    var currentIndex = 0  //first tiger instance in the array or myTiger
    
 //end properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger() //instance created of Tiger Struct
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age) //could have put it above but this is a lesson to practice syntax
        
        myTiger.chuff()
        myTiger.chuffNumberOfTimes(5, isLoud: true)
        
        self.myTigers.append(myTiger) //self in classes can access properties in struct instances where as self cant use properties within a struct itself 
    
        println("My Tiger's name is: \(myTiger.name), its' age is \(myTiger.age), its' breed is \(myTiger.breed) and its' image is: \(myTiger.image!)") //added an optional to 
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)" //string interpolation to convert an int to a string
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.chuff()
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
            thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger] //myTigers was defined as a property so can use self
        
        //can't use self keyword to local variables
        myTiger.chuffNumberOfTimes(3)
        secondTiger.chuffNumberOfTimes(2)
        //
        
        //initialize an instance of class lion
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        //create another instance of lion class
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "lionness.jpg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) { //@IBAction indicates that this function will be called by a button in storybard 
        var randomIndex:Int
        do {
        //generate random number for index
        randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
     
        } while self.currentIndex == randomIndex  //boolean

        self.currentIndex = randomIndex //when different go ahead and update currentIndex to new random number
        //this value or property is saved or persisted because it's declared within the viewcontroller. A new viewcontroller would then have a new property to reference
        
           let tiger = myTigers[randomIndex] //create a tiger array that stores an object randomly selected from the list of instances

//        myImageView.image = tiger.image //display the details of that instance
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)" //needs string interpolation
//        breedLabel.text = tiger.breed
        
        /*beware of advanced code...self is the current instance of the view thats on the screen */
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: {
            (finished: Bool) -> () in //happens after completion of transition
        })
    }
    

    }



