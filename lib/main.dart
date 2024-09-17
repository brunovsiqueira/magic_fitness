import 'package:flutter/material.dart';
import 'package:magic_fitness/src/routes.dart';
import 'package:magic_fitness/src/screens/add_set_screen.dart';
import 'package:magic_fitness/src/screens/workout_list_screen.dart';
import 'package:magic_fitness/src/screens/workout_screen.dart';

void main() => runApp(const MagicFitnessApp());

class MagicFitnessApp extends StatelessWidget {
  const MagicFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.workouts,
      routes: {
        AppRoutes.workouts: (context) => const WorkoutListScreen(),
        AppRoutes.workoutDetails: (context) => const WorkoutScreen(),
        AppRoutes.addSet: (context) => const AddSetScreen(),
      },
    );
  }
}
