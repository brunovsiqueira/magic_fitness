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
    if (state is WorkoutsLoaded) {
      final currentState = state as WorkoutsLoaded;

      await workoutsDatasource.upsertWorkout(workout);

      // Remove any existing workout with the same id and add the new/updated workout
      List<WorkoutModel> updatedList = currentState.workouts
          .where((w) => w.id != workout.id)
          .toList()
        ..add(workout);

      emit(WorkoutsLoaded(updatedList));
    }
  }

  void deleteWorkout(int id) async {
    if (state is WorkoutsLoaded) {
      final currentState = state as WorkoutsLoaded;

      await workoutsDatasource.deleteWorkout(id);

      final updatedList =
          currentState.workouts.where((workout) => workout.id != id).toList();

      emit(WorkoutsLoaded(updatedList));
    }
  }
}
