# RecipeHub - A Flutter Recipe Discovery App

A beautiful, feature-rich Flutter application for discovering, exploring, and saving your favorite recipes from around the world.

## 🎯 Features

### Core Features
- **Recipe Discovery** - Browse and search for recipes using the free MealDB API
- **Multiple Screens** - Navigate between Home, Recipe Details, and Favorites screens
- **Search Functionality** - Search recipes by name in real-time
- **Category Browsing** - Explore recipes by different cuisines and categories
- **Random Recipe Generator** - Get daily recipe inspiration
- **Favorites Management** - Save and manage your favorite recipes

### UI/UX Features
- **Clean, Modern Design** - Material 3 design with custom color schemes
- **Smooth Animations** - Page transitions, card interactions, and loading animations
- **Responsive Layout** - Optimized for different screen sizes
- **Visual Feedback** - Tooltips, snackbars, and interactive buttons
- **Gradient UI Elements** - Beautiful gradient appbars and category cards

### Technical Features
- **Provider State Management** - Clean separation of concerns with Provider package
- **Network Calls** - HTTP API integration with error handling
- **Image Caching** - Cached network images for better performance
- **Tab Navigation** - Tab-based interface for Discover and Categories
- **Undo Functionality** - Undo actions for removed favorites

## 📱 Project Structure

```
lib/
├── main.dart                          # App entry point with Provider setup
├── models/
│   └── recipe_model.dart             # Recipe data model and JSON parsing
├── services/
│   └── recipe_service.dart           # API service for recipe fetching
├── providers/
│   ├── recipe_provider.dart          # State management for recipes
│   └── favorites_provider.dart       # State management for favorites
├── screens/
│   ├── home_screen.dart              # Home page with search and tabs
│   ├── recipe_details_screen.dart    # Recipe details with ingredients
│   └── favorites_screen.dart         # Favorites management screen
├── widgets/
│   ├── recipe_card.dart              # Reusable recipe card widget
│   └── custom_app_bar.dart           # Custom gradient app bar
└── utils/
    ├── theme.dart                    # App theme and styling
    └── constants.dart                # App-wide constants
```

## 🛠️ Technology Stack

- **Framework**: Flutter 3.x
- **State Management**: Provider 6.0+
- **API Integration**: http 1.1+
- **Image Caching**: cached_network_image 3.3+
- **API Source**: TheMealDB (Free Meal Database API)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.11.4)
- Dart SDK (included with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone or navigate to project directory**
   ```bash
   cd task16
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for release**
   ```bash
   flutter build apk        # Android
   flutter build ios        # iOS
   flutter build web        # Web
   ```

## 📖 Usage

### Home Screen
- **Search Tab**: Search for recipes by name
- **Categories Tab**: Browse recipes by category
- Click on any recipe to view full details
- Tap the heart icon to add/remove favorites

### Recipe Details
- View complete ingredients with measurements
- Read step-by-step cooking instructions
- Access recipe category, cuisine, and origin information
- Toggle favorite status
- Access video tutorial link (if available)

### Favorites
- View all saved favorite recipes
- Remove individual favorites with undo option
- Clear all favorites at once

## 🎨 Design Features

### Color Scheme
- Primary Color: `#6D28D9` (Purple)
- Accent Color: `#A855F7` (Light Purple)
- Background: `#F9FAFB` (Off-White)
- Text Dark: `#1F2937` (Dark Gray)
- Text Light: `#6B7280` (Medium Gray)

### Animations
- **Fade & Slide** - Page transitions with smooth animations
- **Scale** - Card tap animations for better feedback
- **Tab Transitions** - Animated tab switching
- **Loading States** - Spinner indicators during data fetching

## 📡 API Integration

Uses **TheMealDB API** (Free):
- `GET /search.php?s={recipe_name}` - Search recipes
- `GET /filter.php?c={category}` - Get recipes by category
- `GET /lookup.php?i={meal_id}` - Get recipe details
- `GET /random.php` - Get random recipe
- `GET /categories.php` - Get all categories

**API Documentation**: [TheMealDB](https://www.themealdb.com/api.php)

## 🔍 Code Quality

### Best Practices
- **Separation of Concerns** - Models, Services, Providers, Screens, Widgets
- **DRY Principle** - Reusable components and utilities
- **Error Handling** - Try-catch blocks and user-friendly error messages
- **Type Safety** - Strong typing throughout the codebase
- **Constants Management** - Centralized app constants

### Widget Structure
- **Stateless Widgets** - For static UI components
- **Stateful Widgets** - For interactive components with animations
- **Consumer Widgets** - For reactive state updates

## 🐛 Error Handling

- Network timeout handling (30 seconds)
- API error responses
- Empty search results
- Image loading failures
- Graceful error messages for users

## ⚡ Performance Optimizations

- Cached network images to reduce data usage
- Lazy loading with GridView builders
- Efficient state management with Provider
- Minimized widget rebuilds
- Image compression through MealDB CDN

## 📝 Future Enhancements

- Offline recipe storage with SQLite
- Share recipes via social media
- Rating and review system
- Recipe filtering by ingredients
- Meal planning calendar
- Dietary preference filters
- Firebase integration for user accounts
- Push notifications for new recipes

## 🏆 Key Achievements

✅ Clean, modern UI with Material 3 design
✅ Proper state management with Provider
✅ Multiple screens with smooth navigation
✅ Real API integration with error handling
✅ Smooth animations and transitions
✅ Well-structured and readable code
✅ Zero crash guarantees with error handling
✅ Responsive design for all screen sizes

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Author

Created as a demonstration of Flutter best practices and modern app development.

---

**Enjoy exploring delicious recipes! 🍳👨‍🍳**
