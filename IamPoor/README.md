# 💸 IamPoor

A fun, lightweight iOS app that displays an animated "I am poor" message — the humorous counterpart to the classic _I Am Rich_ app.

![Platform](https://img.shields.io/badge/Platform-iOS_16+-blue?logo=apple)
![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift)
![UIKit](https://img.shields.io/badge/Framework-UIKit-purple)
![License](https://img.shields.io/badge/License-MIT-green)

## 📖 About

**IamPoor** is a beginner-friendly iOS project that demonstrates core UIKit concepts through a simple animated interface. The app cycles through a series of images to create a looping animation alongside a playful message.

### Features

- 🎞️ Frame-based image animation using `UIImageView`
- 🎨 Custom dark-themed background
- 📱 Storyboard-based UI with `@IBOutlet` connections
- 🔄 Infinite loop animation with configurable duration

## 🛠️ Tech Stack

| Component    | Technology                     |
| ------------ | ------------------------------ |
| Language     | Swift 5.9                      |
| UI Framework | UIKit                          |
| Layout       | Storyboard (Interface Builder) |
| Lifecycle    | `SceneDelegate` (iOS 13+)      |
| Assets       | Asset Catalog (JPEG, 1x/2x/3x) |

## 📁 Project Structure

```
IamPoor/
├── AppDelegate.swift          # Application lifecycle
├── SceneDelegate.swift        # Scene lifecycle (multi-window support)
├── ViewController.swift       # Main screen with animation logic
├── Base.lproj/
│   ├── Main.storyboard        # Primary UI layout
│   └── LaunchScreen.storyboard
├── Assets.xcassets/
│   ├── AppIcon.appiconset/
│   ├── poor_1.imageset/       # Animation frame 1
│   ├── poor_2.imageset/       # Animation frame 2
│   └── poor_3.imageset/       # Animation frame 3
└── Info.plist                 # App configuration
```

## 🚀 Getting Started

### Prerequisites

- **Xcode 16+**
- **iOS 16.0+** deployment target
- macOS Sequoia or later (recommended)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/MrDavudGunduz/IOS-Portfolio/IamPoor.git
   ```
2. Open the project in Xcode:
   ```bash
   cd IamPoor
   open IamPoor.xcodeproj
   ```
3. Select a simulator or connected device and press **⌘ + R** to build and run.

## 🧩 How It Works

The app loads three images (`poor_1`, `poor_2`, `poor_3`) from the Asset Catalog and assigns them to a `UIImageView` as animation frames:

```swift
let imageFrames: [UIImage] = [
    UIImage(named: "poor_1")!,
    UIImage(named: "poor_2")!,
    UIImage(named: "poor_3")!
]

imageView.animationImages = imageFrames
imageView.animationDuration = 1.5
imageView.animationRepeatCount = 0  // Infinite loop
imageView.startAnimating()
```

The animation starts automatically in `viewDidLoad()` and loops indefinitely at **0.5 seconds per frame**.

## 📸 Screenshots

> _Add screenshots of the running app here._

## 🗺️ Roadmap

- [ ] Migrate to Auto Layout for multi-device support
- [ ] Replace force unwraps with safe image loading
- [ ] Add accessibility labels for VoiceOver
- [ ] Add localization support
- [ ] Add unit and UI tests
- [ ] Consider SwiftUI migration

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Davud Gündüz**

---

<p align="center">Made with ❤️ and a sense of humor</p>
