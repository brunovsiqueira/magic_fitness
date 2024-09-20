// workout_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_fitness/src/blocs/workout_cubit.dart';
import 'package:magic_fitness/src/blocs/workouts_state.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/models/workout_model.dart';
import 'package:magic_fitness/src/routes.dart';

class WorkoutListScreen extends StatelessWidget {
  final WorkoutsDatasource workoutsDatasource;

  const WorkoutListScreen({super.key, required this.workoutsDatasource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            if (state is WorkoutsLoaded) {
              return ListView.builder(
                itemCount: state.workouts.length,
                itemBuilder: (context, index) {
                  final workout = state.workouts[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      title: Text('Workout ${index + 1}'),
                      subtitle: Text('${workout.setList.length} sets'),
                      trailing: const Icon(Icons.bar_chart, color: Colors.blue),
                      onTap: () async {
                        final updatedWorkout = await Navigator.pushNamed(
                          context,
                          AppRoutes.workoutDetails,
                          arguments: workout,
                        ) as WorkoutModel?;

                        if (updatedWorkout != null && context.mounted) {
                          context
                              .read<WorkoutsCubit>()
                              .upsertWorkout(updatedWorkout);
                          _showUpdatedFeedback(context);
                        }
                      },
                    ),
                  );
                },
              );
            }

            return const Center(
                child:
                    CircularProgressIndicator()); // This will rarely show since loading is fast
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final updatedWorkout = await Navigator.pushNamed(
            context,
            AppRoutes.workoutDetails,
          ) as WorkoutModel?;

          if (updatedWorkout != null && context.mounted) {
            context.read<WorkoutsCubit>().upsertWorkout(updatedWorkout);
            _showUpdatedFeedback(context);
          }
        },
        label: const Text('New Workout'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showUpdatedFeedback(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Workout updated!')),
    );
  }
}
