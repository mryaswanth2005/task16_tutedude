class AppConstants {
  // App info
  static const String appName = 'RecipeHub';
  static const String appVersion = '1.0.0';

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 800);

  // Empty states
  static const String noRecipesMessage =
      'No recipes found. Try searching for something!';
  static const String noFavoritesMessage =
      'No favorite recipes yet. Start adding some!';
  static const String loadingMessage = 'Loading delicious recipes...';

  // API timeout
  static const Duration apiTimeout = Duration(seconds: 30);
}
