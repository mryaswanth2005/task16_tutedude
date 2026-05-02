# 📊 RecipeHub App Structure & Flow Diagrams

## App Navigation Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                        RecipeHub App                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│  ┌──────────────────────┐                                        │
│  │   Home Screen        │                                        │
│  │  ┌────────────────┐  │                                        │
│  │  │ Search Bar     │  │◄─────────┐                           │
│  │  └────────────────┘  │          │                           │
│  │  ┌────────────────┐  │          │                           │
│  │  │ Discover Tab   │  │          │                           │
│  │  ├─ Random List   │  │          │                           │
│  │  └────────────────┘  │          │                           │
│  │  ┌────────────────┐  │          │                           │
│  │  │ Categories Tab │  │          │                           │
│  │  ├─ Browse List   │  │          │                           │
│  │  └────────────────┘  │          │                           │
│  │  ┌────────────────┐  │          │                           │
│  │  │ ❤️ Favorites    │  │──┐       │                           │
│  │  └────────────────┘  │  │       │                           │
│  └──────────┬───────────┘  │       │                           │
│             │              │       │                           │
│          (Tap)          (Tap)     (Back)                        │
│             ▼              ▼       │                           │
│  ┌──────────────────────┐ │       │                           │
│  │ Recipe Details Screen│ │   ┌───────────────────┐           │
│  │ ┌────────────────────┤ │   │ Favorites Screen  │           │
│  │ │ Image + Metadata   │ │   │ ┌───────────────┐ │           │
│  │ │ ❤️ Favorite Button  │ │   │ │ Saved Recipes │ │           │
│  │ │ Ingredients List   │ │   │ ├───────────────┤ │           │
│  │ │ Instructions       │ │   │ │ Remove (Undo) │ │           │
│  │ │ 📺 Video Link     │ │   │ │ Clear All     │ │           │
│  │ │ Back Button       ─┼─┼──►│ │ Back Button   ─┼─┼───────┐ │
│  │ └────────────────────┤ │   │ └───────────────┘ │       │ │
│  └──────────────────────┘ │   └───────────────────┘       │ │
│                           │                                │ │
│                           └────────────────────────────────┘ │
│                                                               │
└─────────────────────────────────────────────────────────────────┘
```

## State Management Architecture

```
┌────────────────────────────────────────────────────────────────┐
│                      MultiProvider Setup                        │
├────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────────────┐        ┌──────────────────────┐      │
│  │ RecipeProvider       │        │ FavoritesProvider    │      │
│  ├──────────────────────┤        ├──────────────────────┤      │
│  │ State:               │        │ State:               │      │
│  │ • _recipes[]         │        │ • _favorites[]       │      │
│  │ • _randomRecipes[]   │        │                      │      │
│  │ • _categories[]      │        │ Methods:             │      │
│  │ • _isLoading         │        │ • toggleFavorite()   │      │
│  │ • _error             │        │ • isFavorite()       │      │
│  │ • _searchQuery       │        │ • addFavorite()      │      │
│  │                      │        │ • removeFavorite()   │      │
│  │ Methods:             │        │ • clearFavorites()   │      │
│  │ • searchRecipes()    │        │                      │      │
│  │ • getRandomRecipes() │        │ notifyListeners()    │      │
│  │ • getCategories()    │        │ on every change      │      │
│  │ • getByCategory()    │        │                      │      │
│  │                      │        │                      │      │
│  │ notifyListeners()    │        │                      │      │
│  │ on every change      │        │                      │      │
│  └──────────────────────┘        └──────────────────────┘      │
│           │                               │                     │
│           └───────────┬───────────────────┘                     │
│                       ▼                                         │
│          ┌────────────────────────┐                           │
│          │  Consumer Widgets      │                           │
│          ├────────────────────────┤                           │
│          │ Automatically rebuild  │                           │
│          │ when providers change  │                           │
│          │                        │                           │
│          │ • Home Screen          │                           │
│          │ • Recipe Cards         │                           │
│          │ • Favorite Counter     │                           │
│          │ • Favorites Screen     │                           │
│          └────────────────────────┘                           │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Data Flow Diagram

```
                        User Interaction
                              │
                              ▼
                    ┌──────────────────┐
                    │  UI Layer        │
                    │  (Screens/       │
                    │   Widgets)       │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │  Provider Call   │
                    │  (searchRecipes()│
                    │   addFavorite()) │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │  Service Layer   │
                    │  (RecipeService) │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │  API Layer       │
                    │  (HTTP Calls)    │
                    └────────┬─────────┘
                             │
                    ┌────────┴────────┐
                    ▼                 ▼
                  Success          Error
                    │                 │
                    ▼                 ▼
        ┌──────────────────┐  ┌──────────────┐
        │ Parse JSON to    │  │ Set _error   │
        │ Recipe objects   │  │ notifyList.. │
        └────────┬─────────┘  └──────┬───────┘
                 │                   │
                 ▼                   ▼
        ┌──────────────────┐  ┌──────────────┐
        │ Update Provider  │  │ UI shows     │
        │ _recipes[]       │  │ error msg    │
        │ notifyListeners()│  └──────────────┘
        └────────┬─────────┘
                 │
                 ▼
        ┌──────────────────┐
        │ Consumer rebuilds│
        │ with new state   │
        └────────┬─────────┘
                 │
                 ▼
        ┌──────────────────┐
        │ UI updates with  │
        │ search results   │
        └──────────────────┘
```

## Screen Component Hierarchy

```
HomeScreen
├── CustomAppBar
│   ├── Title: "RecipeHub"
│   └── Actions
│       └── Favorites counter badge
├── Body: SingleChildScrollView
│   ├── Padding
│   │   ├── Search TextField
│   │   │   ├── prefixIcon (search)
│   │   │   └── suffixIcon (clear)
│   │   ├── TabBar (Discover/Categories)
│   │   │   ├── Animated indicator
│   │   │   └── Label switcher
│   │   └── TabBarView
│   │       ├── Tab 1: Discover
│   │       │   └── GridView.builder
│   │       │       └── RecipeCard x N
│   │       │           ├── Image (CachedNetworkImage)
│   │       │           ├── Gradient overlay
│   │       │           ├── Favorite button (FloatingButton)
│   │       │           └── Recipe info
│   │       │
│   │       └── Tab 2: Categories
│   │           └── GridView.builder
│   │               └── CategoryCard x N
│   │                   ├── Icon
│   │                   └── Title
│   │
│   └── Navigation (when tapped)
│       └── RecipeDetailsScreen or
│           CategorySearch

RecipeDetailsScreen
├── CustomAppBar ("Recipe Details")
└── Body: SingleChildScrollView
    ├── Stack
    │   ├── Image (CachedNetworkImage)
    │   ├── Gradient overlay
    │   └── Favorite button (Positioned)
    ├── Padding
    │   ├── Title
    │   ├── Metadata tags
    │   │   ├── Category
    │   │   ├── Area
    │   │   └── Cuisine
    │   ├── Ingredients section
    │   │   └── Container with list
    │   │       └── Ingredient row x N
    │   ├── Instructions section
    │   │   └── Container with text
    │   └── Video button (if available)

FavoritesScreen
├── CustomAppBar ("Favorite Recipes")
│   └── Clear button
└── Body:
    ├── Empty state (if no favorites)
    │   ├── Icon
    │   ├── Message
    │   └── Explore button
    │
    └── GridView.builder (if has favorites)
        └── RecipeCard x N
            ├── Image
            ├── Favorite button (always filled)
            └── Recipe info
```

## API Call Sequence

```
User Action          Provider          Service          API
    │                   │                  │              │
    ├─ Search ────────►  │                  │              │
    │                    ├─ Set loading    │              │
    │                    ├─ Call search ──►│              │
    │                    │                 ├─ HTTP GET ──►│
    │                    │                 │              ├─ Query
    │                    │                 │              │
    │                    │                 │◄─ Response ─┤
    │                    │                 │              │
    │                    │                 ├─ Parse JSON◄┤
    │                    │                 │              │
    │                    │◄─ Recipes ──────┤              │
    │                    │                 │              │
    │                    ├─ Update _recipes           
    │                    ├─ Set loading=false
    │                    ├─ notifyListeners()
    │                    │
    │◄─ Rebuild ────────┤
    │
    ├─ Display results
```

## File Dependencies

```
main.dart
├── providers/recipe_provider.dart
├── providers/favorites_provider.dart
├── screens/home_screen.dart
└── utils/theme.dart

home_screen.dart
├── models/recipe_model.dart
├── providers/recipe_provider.dart
├── providers/favorites_provider.dart
├── screens/recipe_details_screen.dart
├── screens/favorites_screen.dart
├── widgets/recipe_card.dart
├── widgets/custom_app_bar.dart
└── utils/theme.dart

recipe_details_screen.dart
├── models/recipe_model.dart
├── providers/favorites_provider.dart
├── widgets/custom_app_bar.dart
└── utils/theme.dart

recipe_card.dart
├── models/recipe_model.dart
└── utils/theme.dart

recipe_provider.dart
├── models/recipe_model.dart
└── services/recipe_service.dart

recipe_service.dart
└── models/recipe_model.dart
```

## State Update Cycle

```
1. User Interaction
   ▼
2. Provider Method Called
   ├─ Set _isLoading = true
   ├─ Clear _error
   └─ notifyListeners()
   ▼
3. Consumers Rebuild (Loading)
   ├─ Show spinner
   ├─ Disable buttons
   └─ Show "Loading..."
   ▼
4. Async Operation
   ├─ Call API
   ├─ Parse response
   └─ Handle errors
   ▼
5. Provider Update
   ├─ Update state (_recipes, _favorites, etc)
   ├─ Set _isLoading = false
   ├─ Set _error if needed
   └─ notifyListeners()
   ▼
6. Consumers Rebuild (Final)
   ├─ Hide spinner
   ├─ Enable buttons
   └─ Show results or error
```

## Performance Optimization Paths

```
GridView with 100 recipe cards
          │
          ▼
    GridView.builder (Lazy)
          │
          ├─ Only renders visible items
          ├─ Recycles widget cells
          └─ Reduces memory footprint
          
    Recipe Card Widget
          │
          └─ CachedNetworkImage
              ├─ First load: Downloads from URL
              ├─ Subsequent: Loads from cache
              └─ Reduces bandwidth significantly
              
    State Management
          │
          └─ Consumer widgets
              ├─ Only rebuild when subscribed state changes
              ├─ Other state changes are ignored
              └─ Reduces unnecessary rebuilds
```

## Error Handling Flow

```
API Call
    │
    ▼
Timeout? ────Yes───► Set error
    │                timeout message
    No
    │
    ▼
Status ≠ 200? ──Yes─► Set error
    │                API error
    No
    │
    ▼
JSON Parse? ───Yes─► Skip invalid
    │                Continue with valid
    No
    │
    ▼
Success
    │
    ├─ Parse data
    ├─ Update provider
    ├─ notifyListeners()
    └─ UI updates
```

---

## Key Architecture Features

✅ **Single Responsibility** - Each class has one purpose
✅ **Loose Coupling** - Layers communicate through interfaces
✅ **High Cohesion** - Related functionality grouped together
✅ **Dependency Injection** - Providers manage dependencies
✅ **Reactive Programming** - State changes trigger rebuilds
✅ **Error Boundaries** - Errors don't crash app
✅ **Performance** - Lazy loading and caching
✅ **Testability** - Each layer can be tested independently

---

**These diagrams help visualize how RecipeHub is structured and how data flows through the app!** 📊
