import 'package:flutter/material.dart';
import 'package:task16/models/recipe_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Recipe> _favorites = [];

  List<Recipe> get favorites => _favorites;
  int get favoriteCount => _favorites.length;

  bool isFavorite(Recipe recipe) {
    return _favorites.any((fav) => fav.id == recipe.id);
  }

  void toggleFavorite(Recipe recipe) {
    if (isFavorite(recipe)) {
      _favorites.removeWhere((fav) => fav.id == recipe.id);
    } else {
      _favorites.add(recipe);
    }
    notifyListeners();
  }

  void addFavorite(Recipe recipe) {
    if (!isFavorite(recipe)) {
      _favorites.add(recipe);
      notifyListeners();
    }
  }

  void removeFavorite(Recipe recipe) {
    if (isFavorite(recipe)) {
      _favorites.removeWhere((fav) => fav.id == recipe.id);
      notifyListeners();
    }
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
