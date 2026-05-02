import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task16/providers/recipe_provider.dart';
import 'package:task16/providers/favorites_provider.dart';
import 'package:task16/screens/home_screen.dart';
import 'package:task16/utils/theme.dart';
import 'package:task16/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: AppTheme.getLightTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
