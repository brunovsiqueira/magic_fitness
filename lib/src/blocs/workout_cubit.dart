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

  void updateWorkoutInList(WorkoutModel updatedWorkout) async {
    if (state is WorkoutsLoaded) {
      final currentState = state as WorkoutsLoaded;
      final updatedList = currentState.workouts
          .map((workout) =>
              workout.id == updatedWorkout.id ? updatedWorkout : workout)
          .toList();

      await workoutsDatasource.updateWorkout(updatedWorkout);
      emit(WorkoutsLoaded(updatedList));
    }
  }
}
