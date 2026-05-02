import 'package:flutter/material.dart';
import 'package:task16/models/recipe_model.dart';
import 'package:task16/services/recipe_service.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeService _recipeService = RecipeService();

  List<Recipe> _recipes = [];
  List<Recipe> _randomRecipes = [];
  List<String> _categories = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  List<Recipe> get recipes => _recipes;
  List<Recipe> get randomRecipes => _randomRecipes;
  List<String> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get searchQuery => _searchQuery;

  Future<void> searchRecipes(String query) async {
    if (query.isEmpty) {
      _recipes = [];
      _searchQuery = '';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    _searchQuery = query;
    notifyListeners();

    try {
      _recipes = await _recipeService.searchRecipes(query);
      if (_recipes.isEmpty) {
        _error = 'No recipes found for "$query"';
      }
    } catch (e) {
      _error = 'Error searching recipes: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getRandomRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _randomRecipes = await _recipeService.getRandomRecipes(count: 6);
    } catch (e) {
      _error = 'Error loading random recipes: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getRecipesByCategory(String category) async {
    _isLoading = true;
    _error = null;
    _searchQuery = category;
    notifyListeners();

    try {
      _recipes = await _recipeService.getRecipesByCategory(category);
      if (_recipes.isEmpty) {
        _error = 'No recipes found in this category';
      }
    } catch (e) {
      _error = 'Error loading category recipes: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    try {
      _categories = await _recipeService.getCategories();
    } catch (e) {
      _error = 'Error loading categories: $e';
    }
    notifyListeners();
  }
}
