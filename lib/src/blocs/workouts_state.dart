import 'package:magic_fitness/src/models/workout_model.dart';

sealed class WorkoutsState {}

class WorkoutsInitial extends WorkoutsState {}

class WorkoutsLoaded extends WorkoutsState {
  final List<WorkoutModel> workouts;

  WorkoutsLoaded(this.workouts);
}
