import 'package:isar/isar.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/models/workout_model.dart';

class WorkoutsDatasourceImpl implements WorkoutsDatasource {
  final Isar isar;

  WorkoutsDatasourceImpl(this.isar);

  @override
  Future<void> addWorkout(WorkoutModel workout) async {
    await isar.writeTxn(() async {
      await isar.workoutModels.put(workout);
    });
  }

  @override
  Future<List<WorkoutModel>> getAllWorkouts() async {
    return await isar.workoutModels.where().findAll();
  }

  @override
  Future<WorkoutModel?> getWorkoutById(int id) async {
    return await isar.workoutModels.get(id);
  }

  @override
  Future<void> updateWorkout(WorkoutModel workout) async {
    await isar.writeTxn(() async {
      await isar.workoutModels.put(workout);
    });
  }

  @override
  Future<void> deleteWorkout(int id) async {
    await isar.writeTxn(() async {
      await isar.workoutModels.delete(id);
    });
  }
}
