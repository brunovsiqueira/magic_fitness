import 'package:magic_fitness/src/models/workout_model.dart';

abstract class WorkoutsDatasource {
  Future<void> upsertWorkout(WorkoutModel workout);
  Future<List<WorkoutModel>> getAllWorkouts();
  Future<WorkoutModel?> getWorkoutById(int id);
  Future<void> deleteWorkout(int id);
}
