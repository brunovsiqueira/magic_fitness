import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_fitness/src/blocs/workouts_state.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/models/workout_model.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  final WorkoutsDatasource workoutsDatasource;

  WorkoutsCubit(this.workoutsDatasource) : super(WorkoutsInitial());

  void fetchWorkouts() async {
    final workouts = await workoutsDatasource.getAllWorkouts();
    emit(WorkoutsLoaded(workouts));
  }

  void upsertWorkout(WorkoutModel workout) async {
    await workoutsDatasource.upsertWorkout(workout);

    // Fetch the updated list of workouts from the datasource
    final workouts = await workoutsDatasource.getAllWorkouts();
    emit(WorkoutsLoaded(workouts));
  }

  void deleteWorkout(int id) async {
    await workoutsDatasource.deleteWorkout(id);

    // Fetch the updated list of workouts from the datasource
    final workouts = await workoutsDatasource.getAllWorkouts();
    emit(WorkoutsLoaded(workouts));
  }
}
