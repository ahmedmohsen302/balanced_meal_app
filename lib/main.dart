import 'package:balanced_meal_app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BalancedMealApp());
}

class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
