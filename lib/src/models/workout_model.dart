import 'package:isar/isar.dart';
import 'package:magic_fitness/src/models/set_model.dart';

@collection
class WorkoutModel {
  final Id id = Isar.autoIncrement;
  final DateTime date;
  final List<SetModel> sets;

  WorkoutModel({
    required this.date,
    required this.sets,
  });
}
