//
//  ViewController.swift
//  IamPoor
//
//  Created by Davud Gunduz on 17.03.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startPoorAnimation()
    }
    func startPoorAnimation() {
            // Görsel isimlerini sırasıyla diziye ekliyoruz.
            // Assets.xcassets klasöründeki isimlerle aynı olmalı.
            let imageFrames: [UIImage] = [
                UIImage(named: "poor_1")!,
                UIImage(named: "poor_2")!,
                UIImage(named: "poor_3")!
            ]
            
            // We assign the images to the ImageView's animation properties.
            imageView.animationImages = imageFrames
            
            // We determine the total duration of the animation (e.g., 1.5 seconds).
            imageView.animationDuration = 1.5
            
            // We choose how many times the animation will repeat. (0 = infinite loop)
            imageView.animationRepeatCount = 0
            
            // We're starting the animation.
            imageView.startAnimating()
        }

}

