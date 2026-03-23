//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation  // Required for AVAudioPlayer and AVAudioSession

// MARK: - ViewController
/// Main view controller responsible for handling xylophone key interactions.
/// Each button on the storyboard represents a musical note (A through G).
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// Called when any xylophone key (button) is pressed.
    /// - Parameter sender: The button that triggered the action, connected via Interface Builder.
    @IBAction func keyPressed(_ sender: Any) {
        
        // Force cast sender to UIButton to access its title property.
        // This assumes sender is always a UIButton (connected in Storyboard).
        let tappedButton = sender as! UIButton
        
        // Use the button's title (e.g. "C", "D") as the sound file name
        // and play the corresponding .wav file through SoundManager.
        SoundManager.shared.playSound(named: tappedButton.titleLabel!.text!)
        
        // --- Button Press Animation ---
        // Step 1: Immediately reduce opacity to 50% to give a "pressed" effect.
        tappedButton.alpha = 0.5
        
        // Step 2: After a 0.2s delay, smoothly animate the opacity back to 100%.
        // This creates a brief flash effect to visually confirm the tap.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.2) {
                tappedButton.alpha = 1.0
            }
        }
        
    }
    

}

// MARK: - SoundManager
/// Singleton class responsible for all audio playback in the app.
/// Uses AVAudioPlayer to play sound files from the app bundle.
///
/// Usage:
/// ```
/// SoundManager.shared.playSound(named: "C")
/// ```
class SoundManager {
    
    /// Shared singleton instance — provides a single point of access
    /// to the sound manager throughout the app.
    static let shared = SoundManager()
    
    /// Holds a strong reference to the active AVAudioPlayer instance.
    /// Without this reference, the player would be deallocated before
    /// the sound finishes playing.
    var player: AVAudioPlayer?
    
    /// Plays a sound file from the app bundle.
    /// - Parameters:
    ///   - name: The name of the sound file (without extension), e.g. "C", "D".
    ///   - fileExtension: The file extension, defaults to "wav".
    func playSound(named name: String, fileExtension: String = "wav") {
        
        // Attempt to find the sound file in the main bundle.
        // If the file doesn't exist, log a message and return early.
        guard let url = Bundle.main.url(forResource: name, withExtension: fileExtension) else {
            print("Could not find file: \(name).\(fileExtension)")
            return
        }
        
        do {
            // Configure the audio session category to .playback so that
            // sound plays even when the device's silent switch is turned on.
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // Initialize the audio player with the sound file URL,
            // prepare the audio buffer, and start playback.
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()   // Preloads the audio buffer for minimal latency
            player?.play()            // Begin playback
        } catch {
            // Log any errors that occur during audio session setup or playback.
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
