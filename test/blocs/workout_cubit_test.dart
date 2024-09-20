import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:magic_fitness/src/blocs/workout_cubit.dart';
import 'package:magic_fitness/src/blocs/workouts_state.dart';
import 'package:magic_fitness/src/models/workout_model.dart';

import '../mocks/mock_workouts_datasource.dart';

void main() {
  group('WorkoutsCubit', () {
    blocTest<WorkoutsCubit, WorkoutsState>(
      'emits [WorkoutsLoaded] when fetchWorkouts is called',
      build: () => WorkoutsCubit(MockWorkoutsDatasource()),
      act: (cubit) => cubit.fetchWorkouts(),
      expect: () => [
        isA<WorkoutsLoaded>()
            .having((state) => state.workouts, 'workouts', isEmpty),
      ],
    );

    blocTest<WorkoutsCubit, WorkoutsState>(
      'adds a workout correctly',
      build: () => WorkoutsCubit(MockWorkoutsDatasource()),
      act: (cubit) async {
        cubit.upsertWorkout(WorkoutModel(date: DateTime.now(), setList: []));
      },
      expect: () => [
        isA<WorkoutsLoaded>()
            .having((state) => state.workouts.length, 'workouts length', 1),
      ],
    );
  });
}
