import 'package:magic_fitness/src/models/workout_model.dart';

abstract class WorkoutsDatasource {
  Future<void> addWorkout(WorkoutModel workout);
  Future<List<WorkoutModel>> getAllWorkouts();
  Future<WorkoutModel?> getWorkoutById(int id);
  Future<void> updateWorkout(WorkoutModel workout);
  Future<void> deleteWorkout(int id);
}
