import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:magic_fitness/src/blocs/workout_cubit.dart';
import 'package:magic_fitness/src/datasources/workout_datasource.dart';
import 'package:magic_fitness/src/datasources/workouts_datasource_impl.dart';
import 'package:magic_fitness/src/models/workout_model.dart';
import 'package:magic_fitness/src/routes.dart';
import 'package:magic_fitness/src/screens/add_set_screen.dart';
import 'package:magic_fitness/src/screens/workout_list_screen.dart';
import 'package:magic_fitness/src/screens/workout_details_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [WorkoutModelSchema],
    directory: dir.path,
  );

  final workoutsDatasource = WorkoutsDatasourceImpl(isar);

  runApp(MagicFitnessApp(
    workoutsDatasource: workoutsDatasource,
  ));
}

class MagicFitnessApp extends StatelessWidget {
  const MagicFitnessApp({super.key, required this.workoutsDatasource});

  final WorkoutsDatasource workoutsDatasource;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkoutsCubit(workoutsDatasource)..fetchWorkouts(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.workouts,
        routes: {
          AppRoutes.workouts: (context) => WorkoutListScreen(
                workoutsDatasource: workoutsDatasource,
              ),
          AppRoutes.workoutDetails: (context) {
            WorkoutModel? workout =
                ModalRoute.of(context)!.settings.arguments as WorkoutModel?;

            return WorkoutDetailsScreen(workout: workout);
          },
          AppRoutes.addSet: (context) => const AddSetScreen(),
        },
      ),
    );
  }
}
