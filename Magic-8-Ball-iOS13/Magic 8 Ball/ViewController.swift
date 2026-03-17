//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Constant array holding all the possible Magic 8 Ball image literals.
    // We use 'let' instead of 'var' because this array's contents will not change.
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    // IBOutlet that connects the image view on the Storyboard to our Swift code.
    @IBOutlet weak var ballUIImage: UIImageView!
    
    // IBAction that gets triggered whenever the user taps the "Ask" button.
  
    
    @IBAction func askActionPressed(_ sender: Any) {
        // Randomly selects an element from the 'ballArray' and assigns it to the image view.
        ballUIImage.image = ballArray.randomElement()
    }
}

