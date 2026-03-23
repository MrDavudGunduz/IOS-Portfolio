//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

  // MARK: - Properties

  // Dictionary to store the boiling times in seconds for different egg preferences.
  var eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]

  // Timer instance to track the countdown.
  var timer: Timer?

  // Variables to track the progress of the boiling process.
  var secondsPassed: Int = 0
  var totalTime: Int = 0

  // MARK: - UI Elements
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var textLabel: UILabel!

  // MARK: - Actions
  @IBAction func eggTimer(_ sender: UIButton) {

    // Safely unwrap the button's title and retrieve the corresponding boiling time.
    guard let hardness = sender.currentTitle,
      let selectedTime = eggTimes[hardness]
    else { return }

    // Invalidate any existing timer to prevent multiple timers from running concurrently.
    timer?.invalidate()

    // Reset state variables and UI elements for the new timer.
    totalTime = selectedTime
    secondsPassed = 0
    progressView.progress = 0.0
    textLabel.text = "\(hardness) egg is preparing..."

    // Schedule a new timer that triggers every second.
    // Using [weak self] in the closure to prevent strong reference cycles (Memory Leaks).
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
      guard let self = self else { return }

      if self.secondsPassed < self.totalTime {
        self.secondsPassed += 1

        // Calculate the percentage of completion and update the progress bar.
        // Casting Int to Float is required for UIProgressView.
        self.progressView.progress = Float(self.secondsPassed) / Float(self.totalTime)
        self.textLabel.text = "\(self.totalTime - self.secondsPassed) saniye kaldı."

        // Check if the timer has successfully finished.
        if self.secondsPassed == self.totalTime {
          self.timer?.invalidate()
          self.textLabel.text = "Egg is ready!"

          // 1. Play the alarm sound using the Singleton SoundManager.
          SoundManager.shared.playSound(sound: .alarm) { [weak self] errorMessage in
            // Show an alert if there is an error playing the sound
            self?.showAlert(title: "Sound Error", message: errorMessage, completion: nil)
          }

          // 2. Show a success alert to the user.
          self.showAlert(
            title: "Bon Appétit!", message: "Your eggs are ready exactly as you wanted them."
          ) {
            // Reset the UI when the user dismisses the alert by tapping "Tamam".
            self.resetUI()
          }
          // Ensure the progress bar is fully filled when done.
          self.progressView.progress = 1.0
        }
      }
    }

  }

  // MARK: - Helper Methods

  /// Resets the UI components and tracking variables to their initial state.
  func resetUI() {
    progressView.progress = 0.0
    textLabel.text = "How do you like your eggs?"
    secondsPassed = 0
    totalTime = 0
  }
}

// MARK: - Extensions

/// Extension to provide a reusable alert presentation method across all ViewControllers.
extension UIViewController {

  /// Presents a standardized UIAlertController.
  /// - Parameters:
  ///   - title: The title of the alert.
  ///   - message: The message body of the alert.
  ///   - completion: An optional closure executed after the user taps "OK".
  func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
      completion?()
    }

    alert.addAction(okAction)

    // Ensure UI updates are performed on the Main Thread.
    DispatchQueue.main.async {
      self.present(alert, animated: true, completion: nil)
    }
  }
}

// MARK: - Audio Management

/// Enum to manage sound file names safely and avoid hardcoded strings (Type Safety).
enum SoundType: String {
  case alarm = "alarm_sound"
  // case tick = "tick_sound" // Easy to expand in the future.
}

/// A Singleton class responsible for handling audio playback throughout the app.
class SoundManager {

  // Shared instance for the Singleton pattern.
  static let shared = SoundManager()

  var player: AVAudioPlayer?

  // Private initializer to prevent creating additional instances from outside.
  private init() {}

  /// Plays a specified sound.
  /// - Parameters:
  ///   - sound: The `SoundType` to play.
  ///   - format: The file extension (default is "mp3").
  ///   - errorHandler: Closure that returns an error message string if playback fails.
  func playSound(sound: SoundType, format: String = "mp3", errorHandler: ((String) -> Void)? = nil)
  {

    guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: format) else {
      errorHandler?("Audio file not found. Please check the file name.")
      return
    }

    do {
      // Configure the audio session to play sound even if the device is on silent mode.
      let audioSession = AVAudioSession.sharedInstance()
      try audioSession.setCategory(.playback, mode: .default, options: [])
      try audioSession.setActive(true)

      player = try AVAudioPlayer(contentsOf: url)
      player?.prepareToPlay()  // Preloads buffers to reduce latency.
      player?.play()

    } catch {
      errorHandler?("Error playing audio: \(error.localizedDescription)")
    }
  }

  /// Stops the currently playing audio.
  func stopSound() {
    player?.stop()
  }
}
