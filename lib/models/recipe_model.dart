class Recipe {
  final String id;
  final String name;
  final String image;
  final String category;
  final String cuisine;
  final String area;
  final List<String> ingredients;
  final List<String> measures;
  final String instructions;
  final String? youtube;
  final String? source;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.cuisine,
    required this.area,
    required this.ingredients,
    required this.measures,
    required this.instructions,
    this.youtube,
    this.source,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] ?? '';
      String measure = json['strMeasure$i'] ?? '';

      if (ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure.isEmpty ? '' : measure);
      }
    }

    return Recipe(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? 'Unknown',
      image: json['strMealThumb'] ?? '',
      category: json['strCategory'] ?? 'General',
      cuisine: json['strCuisine'] ?? 'International',
      area: json['strArea'] ?? 'Unknown',
      ingredients: ingredients,
      measures: measures,
      instructions: json['strInstructions'] ?? 'No instructions available',
      youtube: json['strYoutube'],
      source: json['strSource'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recipe && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
