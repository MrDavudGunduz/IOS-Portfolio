# 💎 I Am Rich

A sleek iOS application inspired by the legendary _I Am Rich_ app — one of the most iconic apps in App Store history. This project demonstrates fundamental iOS development concepts using **UIKit** and **Storyboard-based** UI design.

## Features

- **Elegant UI** — A polished interface featuring a diamond gemstone displayed on a rich, dark-toned background.
- **Auto Layout** — Fully responsive layout that adapts to various iPhone screen sizes using constraint-based positioning.
- **Retina-Ready Assets** — Diamond image assets provided in 1x, 2x, and 3x resolutions for crisp rendering on all devices.

## Tech Stack

| Technology     | Purpose                          |
| -------------- | -------------------------------- |
| **Swift**      | Primary programming language     |
| **UIKit**      | UI framework                     |
| **Storyboard** | Interface design and Auto Layout |
| **Xcode**      | IDE and build system             |

## Project Structure

```
IamRich/
├── AppDelegate.swift          # Application lifecycle management
├── SceneDelegate.swift        # Window scene configuration
├── ViewController.swift       # Main view controller
├── Base.lproj/
│   ├── Main.storyboard        # Primary UI layout
│   └── LaunchScreen.storyboard
├── Assets.xcassets/
│   ├── AppIcon.appiconset/
│   └── diamond.imageset/      # Multi-resolution diamond assets
└── Info.plist                 # App configuration
```

## Requirements

- iOS 15.0+
- Xcode 15.0+
- Swift 5.9+

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/MrDavudGunduz/IOS-Portfolio/IamRich.git
   ```

2. **Open in Xcode**

   ```bash
   cd IamRich
   open IamRich.xcodeproj
   ```

3. **Build & Run**
   - Select a simulator or connected device.
   - Press `Cmd + R` to build and run.

## Architecture

The app follows a simple **MVC (Model-View-Controller)** pattern:

- **View Layer** — Defined entirely in `Main.storyboard` with Auto Layout constraints for responsive design.
- **Controller Layer** — `ViewController.swift` manages the view lifecycle.
- **App Lifecycle** — Managed by `AppDelegate` and `SceneDelegate` using the modern UIScene API.

## License

This project is available under the [MIT License](LICENSE).

## Author

**Davud Gunduz**

---

> _"I Am Rich" — a statement, an icon, a piece of App Store history._
