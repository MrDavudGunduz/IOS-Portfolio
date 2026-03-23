<p align="center">
  <img src="Documentation/AppBreweryBanner.png" alt="App Brewery Banner" width="100%">
</p>

<h1 align="center">🥚 EggTimer</h1>

<p align="center">
  <strong>A beautifully simple iOS egg timer that helps you boil eggs to perfection — every single time.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-iOS_13+-blue?logo=apple" alt="Platform">
  <img src="https://img.shields.io/badge/Swift-5.0-orange?logo=swift" alt="Swift">
  <img src="https://img.shields.io/badge/UIKit-Storyboard-purple" alt="UIKit">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License">
  <img src="https://img.shields.io/badge/Version-1.0-brightgreen" alt="Version">
</p>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Architecture](#architecture)
- [Technical Details](#technical-details)
- [Getting Started](#getting-started)
- [Requirements](#requirements)
- [Project Structure](#project-structure)
- [Key Learnings](#key-learnings)
- [Future Improvements](#future-improvements)
- [Acknowledgements](#acknowledgements)
- [License](#license)

---

## Overview

EggTimer is an iOS application that provides scientifically accurate countdown timers for boiling eggs to three levels of doneness: **Soft**, **Medium**, and **Hard**. The app features real-time progress tracking, audio alerts with alarm sound, and a clean, intuitive user interface.

Built with **UIKit** and following established iOS design patterns, this project demonstrates Timer API usage, the Singleton pattern, AVFoundation audio playback, and responsive UI with StackViews.

---

## Features

| Feature                      | Description                                               |
| ---------------------------- | --------------------------------------------------------- |
| 🥚 **Three Cooking Presets** | Soft (5 min), Medium (7 min), Hard (12 min)               |
| ⏱️ **Live Countdown**        | Real-time progress bar with remaining seconds display     |
| 🔊 **Audio Alert**           | Alarm sound plays on completion — even in silent mode     |
| 🛡️ **Memory Safe**           | Proper `[weak self]` usage and timer lifecycle management |
| 🎨 **Responsive Layout**     | StackView-based UI that adapts to all iPhone screen sizes |
| ⚠️ **Error Handling**        | Graceful error alerts for audio playback failures         |

---

## Screenshots

<p align="center">
  <i>The app presents three egg options with corresponding images. Users tap their preference to start a countdown timer with a progress bar.</i>
</p>

---

## Architecture

The application follows a **Singleton + MVC** architecture:

```
┌─────────────────────────────────────────────────┐
│                  Storyboard (View)               │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐      │
│  │ Soft Egg  │  │Medium Egg│  │ Hard Egg │      │
│  │  Button   │  │  Button  │  │  Button  │      │
│  └─────┬─────┘  └─────┬────┘  └─────┬────┘      │
│        └───────────────┼─────────────┘           │
│                        ▼                         │
│               ┌────────────────┐                 │
│               │  ProgressView  │                 │
│               └────────────────┘                 │
└────────────────────────┬────────────────────────-┘
                         │ IBAction / IBOutlet
                         ▼
┌─────────────────────────────────────────────────┐
│             ViewController (Controller)          │
│                                                  │
│  • eggTimes Dictionary (Model Data)              │
│  • Timer-based countdown logic                   │
│  • Progress calculation & UI updates             │
│  • Alert presentation                            │
└────────────────────────┬────────────────────────-┘
                         │ delegates to
                         ▼
┌─────────────────────────────────────────────────┐
│          SoundManager (Singleton Service)         │
│                                                  │
│  • AVAudioPlayer management                      │
│  • Audio session configuration                   │
│  • Type-safe SoundType enum                      │
└─────────────────────────────────────────────────┘
```

---

## Technical Details

### Timer Management

The app uses `Timer.scheduledTimer(withTimeInterval:repeats:)` with a block-based API. Key implementation details:

- **Retain cycle prevention** — `[weak self]` capture list in the timer closure
- **Timer invalidation** — Previous timer is always invalidated before starting a new one
- **Safe unwrapping** — `guard let` pattern for both button title and dictionary lookup

```swift
timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
    guard let self = self else { return }
    // countdown logic
}
```

### Audio System

The `SoundManager` class implements the **Singleton pattern** with a private initializer:

- Configures `AVAudioSession` with `.playback` category to bypass the silent switch
- Uses `SoundType` enum for type-safe sound file references
- Provides error callback for graceful failure handling
- Calls `prepareToPlay()` to preload audio buffers and minimize latency

### UI Layout

The interface is built with a **nested StackView** hierarchy in Interface Builder:

```
Vertical StackView (fillEqually, spacing: 39)
├── Title View → UILabel ("How do you like your eggs?")
├── Horizontal StackView (fillEqually, spacing: 20)
│   ├── Soft Egg View  → ImageView + Button
│   ├── Medium Egg View → ImageView + Button
│   └── Hard Egg View  → ImageView + Button
└── Timer View → UIProgressView
```

---

## Getting Started

### Prerequisites

- **Xcode 11.0** or later
- **iOS 13.0+** deployment target
- macOS with Xcode installed

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/EggTimer-iOS13.git
   ```

2. **Open the project**

   ```bash
   cd EggTimer-iOS13
   open EggTimer.xcodeproj
   ```

3. **Build and run**
   - Select a simulator or connected device
   - Press `Cmd + R` to build and run

> **Note:** No third-party dependencies or CocoaPods required. The project compiles out of the box.

---

## Requirements

| Requirement | Version           |
| ----------- | ----------------- |
| iOS         | 13.0+             |
| Xcode       | 11.0+             |
| Swift       | 5.0+              |
| Device      | iPhone (Portrait) |

---

## Project Structure

```
EggTimer-iOS13/
├── EggTimer/
│   ├── AppDelegate.swift           # Application lifecycle management
│   ├── SceneDelegate.swift         # Scene lifecycle (iOS 13+)
│   ├── ViewController.swift        # Main timer logic & UI controller
│   │   ├── ViewController          # Timer countdown, progress, alerts
│   │   ├── UIViewController+Ext    # Reusable alert presentation
│   │   ├── SoundType               # Type-safe sound file enum
│   │   └── SoundManager            # Singleton audio playback service
│   ├── Assets.xcassets/
│   │   ├── soft_egg.imageset/      # Soft-boiled egg illustration
│   │   ├── medium_egg.imageset/    # Medium-boiled egg illustration
│   │   └── hard_egg.imageset/      # Hard-boiled egg illustration
│   ├── Base.lproj/
│   │   ├── Main.storyboard         # Main UI layout
│   │   └── LaunchScreen.storyboard # Launch screen
│   ├── alarm_sound.mp3             # Timer completion alarm
│   └── Info.plist                  # App configuration
├── Documentation/
│   ├── AppBreweryBanner.png
│   └── readme-end-banner.png
└── README.md
```

---

## Key Learnings

This project demonstrates several fundamental iOS development concepts:

- **Swift Dictionaries** — Mapping egg types to cooking durations
- **Timer API** — Scheduling repeating timers with block-based syntax
- **UIProgressView** — Visualizing countdown progress in real-time
- **AVFoundation** — Audio playback with session configuration
- **Singleton Pattern** — Centralized audio management via `SoundManager`
- **Memory Management** — Preventing retain cycles with `[weak self]`
- **Guard Statements** — Safe optional unwrapping for robust code
- **UIAlertController** — Presenting alerts with completion handlers

---

## Future Improvements

- [ ] **Background Timer Support** — Use `Date`-based calculations + Local Notifications
- [ ] **Modular Architecture** — Separate SoundManager and models into dedicated files
- [ ] **Localization** — Multi-language support via String Catalogs
- [ ] **Haptic Feedback** — `UINotificationFeedbackGenerator` on timer completion
- [ ] **Custom Durations** — Allow users to set custom boiling times
- [ ] **Dark Mode** — Adaptive color scheme for light and dark appearances
- [ ] **Unit Tests** — Test timer logic and SoundManager independently
- [ ] **Auto Layout Fix** — Replace fixed-frame ProgressView with proper constraints
- [ ] **Accessibility** — VoiceOver support and Dynamic Type

---

## Acknowledgements

This project is based on [The App Brewery's](https://www.appbrewery.co/) Complete App Development Bootcamp curriculum, enhanced with professional-grade patterns including Singleton audio management, type-safe enums, memory-safe timer handling, and comprehensive error handling.

---

## License

This project is available for educational purposes. See [The App Brewery](https://www.appbrewery.co/) for the original course material.

---

<p align="center">
  <img src="Documentation/readme-end-banner.png" alt="End Banner" width="100%">
</p>
