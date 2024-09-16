import 'package:isar/isar.dart';
import 'package:magic_fitness/src/models/set_model.dart';

part 'workout_model.g.dart';

@collection
class WorkoutModel {
  final Id id = Isar.autoIncrement;
  final DateTime date;
  final IsarLinks<SetModel> sets = IsarLinks<SetModel>();

  WorkoutModel({
    required this.date,
  });
}
