import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task16/models/recipe_model.dart';

class RecipeService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Recipe>> searchRecipes(String query) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/search.php?s=$query'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final meals = json['meals'];

        if (meals == null) {
          return [];
        }

        return List<Recipe>.from(
          (meals as List).map((meal) => Recipe.fromJson(meal)),
        );
      }
      return [];
    } catch (e) {
      print('Error searching recipes: $e');
      return [];
    }
  }

  Future<List<Recipe>> getRecipesByCategory(String category) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/filter.php?c=$category'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final meals = json['meals'];

        if (meals == null) {
          return [];
        }

        // Filter endpoint returns limited data, so we fetch full details
        List<Recipe> recipes = [];
        for (var meal in meals.take(12)) {
          final fullRecipe = await getRecipeDetails(meal['idMeal']);
          if (fullRecipe != null) {
            recipes.add(fullRecipe);
          }
        }
        return recipes;
      }
      return [];
    } catch (e) {
      print('Error fetching recipes by category: $e');
      return [];
    }
  }

  Future<Recipe?> getRecipeDetails(String mealId) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/lookup.php?i=$mealId'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final meals = json['meals'];

        if (meals == null || meals.isEmpty) {
          return null;
        }

        return Recipe.fromJson(meals[0]);
      }
      return null;
    } catch (e) {
      print('Error fetching recipe details: $e');
      return null;
    }
  }

  Future<List<Recipe>> getRandomRecipes({int count = 6}) async {
    try {
      List<Recipe> recipes = [];
      for (int i = 0; i < count; i++) {
        final response = await http
            .get(Uri.parse('$baseUrl/random.php'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          final meals = json['meals'];

          if (meals != null && meals.isNotEmpty) {
            recipes.add(Recipe.fromJson(meals[0]));
          }
        }
      }
      return recipes;
    } catch (e) {
      print('Error fetching random recipes: $e');
      return [];
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/categories.php'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final categories = json['categories'];

        if (categories == null) {
          return [];
        }

        return List<String>.from(
          (categories as List).map((cat) => cat['strCategory']).take(8),
        );
      }
      return [];
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
