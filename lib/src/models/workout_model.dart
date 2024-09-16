import 'package:magic_fitness/src/models/set_model.dart';

class WorkoutModel {
  final String id;
  final DateTime date;
  final List<SetModel> sets;

  WorkoutModel({
    required this.id,
    required this.date,
    required this.sets,
  });
}
