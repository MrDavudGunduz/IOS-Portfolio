![App Brewery Banner](Documentation/AppBreweryBanner.png)

# 🎵 Xylophone

A colorful and interactive xylophone app. Play 7 different notes (A-G) with a single tap and enjoy the music experience with visual button animations.

---

## 📱 Screenshot

> The app features color-coded buttons for each note and provides visual feedback on tap.

---

## 🏗️ Architecture

The project is built on the **Singleton Pattern** and the **AVFoundation** framework.

```
Xylophone/
├── AppDelegate.swift          # Application lifecycle
├── SceneDelegate.swift        # Scene lifecycle
├── ViewController.swift       # UI controller + SoundManager
├── Assets.xcassets/           # App icon and images
│   ├── AppIcon.appiconset/
│   ├── AppBreweryLogo.imageset/
│   └── background.imageset/
├── Sounds/                    # Audio files
│   ├── A.wav
│   ├── B.wav
│   ├── C.wav
│   ├── D.wav
│   ├── E.wav
│   ├── F.wav
│   └── G.wav
├── Base.lproj/                # Storyboard files
├── LaunchScreen.storyboard
└── Info.plist
```

---

## 🔑 Key Features

| Feature                    | Description                                                            |
| -------------------------- | ---------------------------------------------------------------------- |
| **7-Note Support**         | Full note scale from A to G                                            |
| **Singleton SoundManager** | Centralized audio management (`SoundManager.shared`)                   |
| **Button Animation**       | Visual feedback with alpha animation on tap                            |
| **Silent Mode Support**    | Plays audio even when the silent switch is on via `.playback` category |
| **Safe Audio Loading**     | Protection against missing files using `guard let`                     |

---

## 🛠️ Tech Stack

- **Language:** Swift 5
- **UI Framework:** UIKit (Storyboard-based)
- **Audio Framework:** AVFoundation / AVAudioPlayer
- **Design Pattern:** Singleton Pattern
- **Minimum iOS:** iOS 13.0
- **Xcode:** 11.0+

---

## 📐 Technical Details

### SoundManager

Audio playback is managed through the centralized `SoundManager` singleton class:

```swift
class SoundManager {
    static let shared = SoundManager()
    var player: AVAudioPlayer?

    func playSound(named name: String, fileExtension: String = "wav") {
        guard let url = Bundle.main.url(forResource: name, withExtension: fileExtension) else {
            return
        }
        // AVAudioSession configuration + audio playback
    }
}
```

### Button Animation

Each note button provides tactile feedback by dimming and restoring its alpha value on tap:

```swift
tappedButton.alpha = 0.5
DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    UIView.animate(withDuration: 0.2) {
        tappedButton.alpha = 1.0
    }
}
```

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/<username>/Xylophone-iOS13.git
   ```
2. Open `Xylophone.xcodeproj` with Xcode.
3. Select a Simulator or a physical device.
4. Run with `Cmd + R`.

> **Note:** A physical device is recommended for testing audio output.

---

## 📚 Concepts Covered

- Playing audio files with `AVFoundation`
- `AVAudioSession` configuration and audio categories
- Singleton design pattern with `static let shared`
- Button animations using `UIView.animate`
- Safe optional unwrapping with `guard let`
- Storyboard-to-code connection via `@IBAction`
- ViewController lifecycle

---

## 📄 License

This project was developed as part of [The App Brewery](https://www.appbrewery.co/) Complete App Development Bootcamp.

![End Banner](Documentation/readme-end-banner.png)
