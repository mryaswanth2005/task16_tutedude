# 🚀 RecipeHub - Quick Start Guide

## Prerequisites

Make sure you have Flutter installed and configured:

```bash
flutter --version
flutter doctor
```

## Installation & Running

### Step 1: Navigate to Project Directory
```bash
cd c:\Users\yaswa\Desktop\tutedude\task12\task16
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Run the App

#### On Connected Device/Emulator
```bash
flutter run
```

#### On Specific Device
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device_id>
```

#### On Chrome (Web)
```bash
flutter run -d chrome
```

#### On Android Emulator
```bash
flutter run -d <emulator_id>
```

## Build for Production

### Android APK
```bash
# Debug APK
flutter build apk

# Release APK (split by ABI for smaller size)
flutter build apk --split-per-abi
```

### Android App Bundle (for Play Store)
```bash
flutter build appbundle
```

### iOS IPA
```bash
flutter build ios
```

### Web
```bash
flutter build web --web-renderer html
```

## Development Tips

### Hot Reload
- Press `R` in the terminal while app is running
- Useful for quick UI changes

### Hot Restart
- Press `Shift + R` in the terminal
- Resets app state

### Debug
```bash
flutter run --debug
```

### Release Mode
```bash
flutter run --release
```

### Analyze Code
```bash
flutter analyze
```

### Format Code
```bash
flutter format lib/
```

## Testing the App

### Search Recipes
1. Go to "Discover" tab
2. Type recipe name (e.g., "pasta", "chicken", "pizza")
3. See results in grid view

### Browse Categories
1. Go to "Categories" tab
2. Click on any category
3. View recipes from that category

### Add to Favorites
1. Tap heart icon on any recipe card
2. See favorite count increase in top right
3. View all favorites by clicking heart icon in app bar

### View Recipe Details
1. Tap any recipe card
2. See full ingredients with measurements
3. Read cooking instructions
4. View recipe category, cuisine, and origin

## Troubleshooting

### Dependencies Not Installing
```bash
flutter pub get --offline  # If offline
flutter pub cache clean     # Clear cache
flutter pub get            # Try again
```

### Build Issues
```bash
flutter clean
flutter pub get
flutter run
```

### Device Not Found
```bash
flutter devices           # List devices
flutter run -d <id>      # Run on specific device
```

### Port Already in Use (Android)
```bash
# Kill process on port 8080
lsof -i :8080
kill -9 <PID>
```

## Project Structure

```
task16/
├── lib/                    # App source code
│   ├── main.dart          # Entry point
│   ├── models/            # Data models
│   ├── services/          # API services
│   ├── providers/         # State management
│   ├── screens/           # UI screens
│   ├── widgets/           # Reusable components
│   └── utils/             # Utilities
├── pubspec.yaml           # Dependencies
├── android/               # Android configuration
├── ios/                   # iOS configuration
├── web/                   # Web configuration
└── README.md              # Documentation
```

## Key Features to Try

1. **Search** - Find recipes by name
2. **Categories** - Browse by cuisine type
3. **Favorites** - Save recipes you like
4. **Details** - See full recipe information
5. **Animations** - Smooth transitions between screens

## Performance Tips

- First run might take 1-2 minutes for build
- Cached images improve performance on second run
- Use `flutter run --release` for performance testing
- Check `flutter analyze` for code quality

## Getting Help

```bash
# Flutter help
flutter --help

# Run specific command help
flutter run --help

# Analyze issues
flutter analyze

# See device diagnostics
flutter doctor -v
```

## Next Steps

1. Explore the app UI
2. Test all features
3. Check code structure in `lib/`
4. Modify colors in `lib/utils/theme.dart`
5. Add more features as needed

---

Enjoy using RecipeHub! 🍳👨‍🍳
