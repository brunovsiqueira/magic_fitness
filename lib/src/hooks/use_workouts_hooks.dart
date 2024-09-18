import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/models/workout_model.dart';

class UseWorkoutsResult {
  final List<WorkoutModel> workouts;
  final void Function(WorkoutModel) updateWorkoutInList;

  UseWorkoutsResult({
    required this.workouts,
    required this.updateWorkoutInList,
  });
}

UseWorkoutsResult useWorkouts(WorkoutsDatasource workoutsDatasource) {
  final workouts = useState<List<WorkoutModel>>([]);

  useEffect(() {
    workoutsDatasource.getAllWorkouts().then((fetchedWorkouts) {
      workouts.value = fetchedWorkouts;
    });
    return null;
  }, []);

  // Update a workout in the local list
  void updateWorkout(WorkoutModel updatedWorkout) {
    workoutsDatasource.updateWorkout(updatedWorkout).then((value) => {
          workouts.value = workouts.value
              .map((workout) =>
                  workout.id == updatedWorkout.id ? updatedWorkout : workout)
              .toList()
        });
  }

  return UseWorkoutsResult(
    workouts: workouts.value,
    updateWorkoutInList: updateWorkout,
  );
}
