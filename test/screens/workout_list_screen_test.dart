import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_fitness/src/blocs/workout_cubit.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/models/workout_model.dart';
import 'package:magic_fitness/src/screens/workout_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mocks/mock_workouts_datasource.dart';

void main() {
  testWidgets('WorkoutListScreen displays list of workouts',
      (WidgetTester tester) async {
    final mockDatasource = MockWorkoutsDatasource();
    final workoutsCubit = WorkoutsCubit(mockDatasource);

    final workouts = [
      WorkoutModel(date: DateTime.now(), setList: []),
      WorkoutModel(date: DateTime.now(), setList: []),
    ];

    // Populate the mock datasource
    mockDatasource.workouts = workouts;

    // Fetch workouts to update the cubit's state
    workoutsCubit.fetchWorkouts();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WorkoutsCubit>(
          create: (_) => workoutsCubit,
          child: WorkoutListScreen(workoutsDatasource: mockDatasource),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that the list contains two items
    expect(find.byType(ListTile), findsNWidgets(2));

    // Verify that the titles are correct
    expect(find.text('Workout 1'), findsOneWidget);
    expect(find.text('Workout 2'), findsOneWidget);
  });
}
