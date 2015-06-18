//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Rehan Mahmood on 5/28/15.
//  Copyright (c) 2015 Sysnet Managed Services, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
///////////////////////properties////////////////////
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    var currentIndex = 0  //first tiger instance in the array or myTiger
    
    var currentAnimal = (species: "Tiger", index: 0) //currentAnimal is a tuple with two keys
    
    var lionCubs:[LionCub] = []
    
 //end properties////////////////////////////////////
    
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
        
        //initialize an instance of class lion///////////////
        var lion = Lion()  //now have an instance of lion
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        ////////////////////////////////////////////////////
        
        //create another instance of lion class//
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        /////////////////////////////////////////
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        //////Add Lion and Lionesses to the lion array/////////
        self.lions += [lion, lioness]   ///we can use self because lions is a global property
        ///////////////////////////////////////////////////////
        
        ////////create an instance of LionCub//////
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        lionCub.isAlphaMale = true
        
        /////////end first instance of LionCub///////////
        
        ////////create a second instance of LionCub//////
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
        /////////end code for second instance of LionCub//////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        //@IBAction indicates that this function will be called by a button in storybard
        updateAnimal()
        updateView() 
           }
    //create a helper function that flips between lion or tiger depending what is currently displayed//
    func updateAnimal () {
        switch currentAnimal{
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex) //if a Tiger than this line updates and changes the key in the tuple to a Lion
        case("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    ///////////////////////////
    }
    //function to update UI which is another helper function///
    
    func updateView (){

        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion"{
                
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
                
                
            }
            else if self.currentAnimal.species == "LionCub" {  //check the species element in the currentAnimal tuple///
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFactLabel.text = lionCub.randomFact()
            }
            self.randomFactLabel.hidden = false

            }, completion: {
                (finished: Bool) -> () in //happens after completion of transition
        })

    }

    }



