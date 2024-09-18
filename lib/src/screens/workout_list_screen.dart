import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/hooks/use_workouts_hooks.dart';
import 'package:magic_fitness/src/models/workout_model.dart';
import 'package:magic_fitness/src/routes.dart';

class WorkoutListScreen extends HookWidget {
  final WorkoutsDatasource workoutsDatasource;

  WorkoutListScreen({required this.workoutsDatasource});

  @override
  Widget build(BuildContext context) {
    // Using the custom hook
    final workoutsData = useWorkouts(workoutsDatasource);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout List'),
      ),
      body: ListView.builder(
        itemCount: workoutsData.workouts.length,
        itemBuilder: (context, index) {
          final workout = workoutsData.workouts[index];
          return ListTile(
            title: Text(workout.date.toString()),
            onTap: () async {
              final updatedWorkout = await Navigator.pushNamed(
                context,
                AppRoutes.workoutDetails,
                arguments: workout,
              ) as WorkoutModel?;

              if (updatedWorkout != null) {
                // Update the workout in the local list without refetching
                workoutsData.updateWorkoutInList(updatedWorkout);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Workout updated!')),
                  );
                }
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final updatedWorkout =
              await Navigator.pushNamed(context, AppRoutes.workoutDetails)
                  as WorkoutModel?;
          if (updatedWorkout != null) {
            // Update the workout in the local list without refetching
            workoutsData.updateWorkoutInList(updatedWorkout);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Workout updated!')),
              );
            }
          }
        },
        label: const Text('New Workout'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
