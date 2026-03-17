//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var diceTwoImageView: UIImageView!
    @IBOutlet weak var diceOneImageView: UIImageView!
    
    var dices : [String] = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        diceOneImageView.image = UIImage(named : dices.randomElement()!)
        diceTwoImageView.image = UIImage(named : dices.randomElement()!)
        
    }
   
    
}

