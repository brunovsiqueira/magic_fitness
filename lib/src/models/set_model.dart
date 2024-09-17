import 'package:isar/isar.dart';

part 'set_model.g.dart';

enum Exercise {
  barbellRow(name: 'Barbell row'),
  benchPress(name: 'Bench press'),
  shoulderPress(name: 'Shoulder press'),
  deadlift(name: 'Deadlift'),
  squat(name: 'Squat');

  const Exercise({required this.name});
  final String name;
}

@collection
class SetModel {
  final Id id = Isar.autoIncrement;
  final Exercise exercise;
  final double weight;
  final int repetitions;

  SetModel({
    required this.exercise,
    required this.weight,
    required this.repetitions,
  });
}
