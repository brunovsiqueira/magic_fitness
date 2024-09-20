import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/models/workout_model.dart';

class MockWorkoutsDatasource implements WorkoutsDatasource {
  List<WorkoutModel> workouts = [];

  @override
  Future<void> upsertWorkout(WorkoutModel workout) async {
    final index = workouts.indexWhere((w) => w.id == workout.id);
    if (index != -1) {
      workouts[index] = workout;
    } else {
      // Simulate auto-increment ID assignment
      workout.id = (workouts.isNotEmpty)
          ? (workouts.map((w) => w.id ?? 0).reduce((a, b) => a > b ? a : b) + 1)
          : 1;
      workouts.add(workout);
    }
  }

  @override
  Future<List<WorkoutModel>> getAllWorkouts() async {
    return workouts;
  }

  @override
  Future<WorkoutModel?> getWorkoutById(int id) async {
    return null;
  }

  @override
  Future<void> deleteWorkout(int id) async {
    workouts.removeWhere((w) => w.id == id);
  }
}
