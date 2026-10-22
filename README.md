# 🌟 QuoteSpark — Random Quote Generator

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Provider](https://img.shields.io/badge/State_Management-Provider-blueviolet?style=for-the-badge)](https://pub.dev/packages/provider)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-brightgreen?style=for-the-badge)]()
[![CodeAlpha](https://img.shields.io/badge/CodeAlpha-Task%202-orange?style=for-the-badge)](https://github.com/hailedv/CodeAlpha_ProjectNametask2)

A clean, modern, and responsive Flutter application that delivers daily inspiration through curated quotes. Built as **Task 2** for the **CodeAlpha Mobile Development Internship**, featuring smooth micro-animations, category filtering, favorites persistence, and native sharing.

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Key Features](#-key-features)
- [App Preview & Screens](#-app-preview--screens)
- [Task 2 Requirements Checklist](#-task-2-requirements-checklist)
- [Tech Stack & Packages](#-tech-stack--packages)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation & Setup](#installation--setup)
- [Author & Acknowledgments](#-author--acknowledgments)

---

## 📖 Overview

**QuoteSpark** combines an elegant, distraction-free aesthetic with fluid animations. Users can instantly discover wisdom across various themes, bookmark their favorite quotes for offline reading, copy them to the clipboard, or share them directly with friends and social networks.

---

## ✨ Key Features

- 🎲 **Smart Randomization**
  - Instant quote generator with anti-repetition logic (never shows the same quote consecutively).
  - Smooth fade-and-slide micro-animations between quote transitions.
  - Real-time quote counter tracking session progress.

- 🏷️ **Categorized Inspiration**
  - 8 curated categories: **Motivation** 🔥, **Wisdom** 🦉, **Life** 🌿, **Love** ❤️, **Humor** 😄, **Success** 🏆, **Courage** ⚡, and **Mindfulness** 🧘.
  - Horizontal filter row allowing instant filtering or full-collection browsing.

- ❤️ **Favorites & Local Persistence**
  - Save quotes with a single tap on the interactive heart icon.
  - Stored persistently on device using `shared_preferences`.
  - Dedicated **Favorites Screen** with real-time badge count and quick-access view.

- 📋 **Copy to Clipboard**
  - One-tap copy with formatted quote text and author attribution.
  - Interactive toast/snackbar confirmation.

- 📤 **Native Social Sharing**
  - Share quotes seamlessly to WhatsApp, Telegram, X (Twitter), SMS, or other apps via `share_plus`.

- 🎨 **Modern Dark UI Design**
  - Deep slate tones with warm gradient highlights (`#E94560` to `#F5A623`).
  - Clean typographic hierarchy powered by Google Fonts (`Inter`).
  - Polished launch splash screen with smooth entry transitions.

---

## 📱 App Preview & Screens

| Home Screen | Category Filter | Favorites Screen |
| :---: | :---: | :---: |
| <img src="https://via.placeholder.com/300x600/16213E/FFFFFF?text=Home+Screen" width="220" alt="Home Screen"/> | <img src="https://via.placeholder.com/300x600/16213E/FFFFFF?text=Category+Filter" width="220" alt="Category Filter"/> | <img src="https://via.placeholder.com/300x600/16213E/FFFFFF?text=Favorites" width="220" alt="Favorites Screen"/> |

---

## ✅ Task 2 Requirements Checklist

| Requirement | Description | Status |
| :--- | :--- | :---: |
| **Initial Quote Display** | Shows a curated quote and author upon opening the application | ✅ Done |
| **New Quote Trigger** | Dedicated button to generate fresh quotes dynamically | ✅ Done |
| **Clear Typography** | Legible author and quote text layout with structured styling | ✅ Done |
| **Distraction-Free UI** | Clean card layout, subtle elevation, and rounded modern design | ✅ Done |
| **Share Functionality** | Ability to share quotes directly across external platforms | ✅ Done |
| **Extra Enhancements** | Category filtering, persistent favorites, animations & copy action | ✅ Done |

---

## 🛠️ Tech Stack & Packages

- **Language:** Dart `^3.11.0`
- **Framework:** Flutter SDK
- **State Management:** [`provider`](https://pub.dev/packages/provider) (`^6.1.2`)
- **Local Storage:** [`shared_preferences`](https://pub.dev/packages/shared_preferences) (`^2.3.2`)
- **Native Sharing:** [`share_plus`](https://pub.dev/packages/share_plus) (`^10.0.2`)
- **Typography:** [`google_fonts`](https://pub.dev/packages/google_fonts) (`^6.2.1`)
- **Icons:** [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) (`^1.0.8`)

---

## 📂 Project Structure

```text
lib/
├── data/
│   └── quotes_data.dart          # Curated database of quotes across 8 categories
├── models/
│   └── quote.dart                # Quote model & QuoteCategory enum with emoji extensions
├── providers/
│   └── quote_provider.dart       # State management (randomizer, favorites, filter)
├── screens/
│   ├── favorites_screen.dart     # Bookmarked quotes list & management
│   └── home_screen.dart          # Main interface with quote card & navigation
├── theme/
│   └── app_theme.dart            # Colors, gradients, dark theme definitions
├── widgets/
│   ├── category_filter_row.dart  # Horizontal category selection bar
│   └── quote_card.dart           # Animated card with copy, share & favorite actions
└── main.dart                     # App entry point, orientations, and splash screen
```

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `>=3.11.0`)
- [Dart SDK](https://dart.dev/get-started)
- Android Studio, VS Code, or Xcode (for iOS)
- An active emulator, simulator, or connected physical device

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/hailedv/CodeAlpha_ProjectNametask2.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd CodeAlpha_ProjectNametask2
   ```

3. **Install project dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

---

## 👨‍💻 Author

**Haile Geberemichael**  
*Flutter Mobile App Development Intern — CodeAlpha*

- **GitHub:** [@hailedv](https://github.com/hailedv)
- **Repository:** [CodeAlpha_ProjectNametask2](https://github.com/hailedv/CodeAlpha_ProjectNametask2)

---

## 📄 License

This project is open-source and developed for educational purposes as part of the CodeAlpha Internship.
