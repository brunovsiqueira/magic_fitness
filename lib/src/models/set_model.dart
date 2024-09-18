import 'package:isar/isar.dart';

part 'set_model.g.dart';

@embedded
class SetModel {
  @enumerated
  final Exercise exercise;
  final double? weight;
  final int? repetitions;

  // Constructor without required parameters required by isar
  SetModel({
    this.exercise = Exercise.squat,
    this.weight,
    this.repetitions,
  });
}

enum Exercise {
  barbellRow(name: 'Barbell row'),
  benchPress(name: 'Bench press'),
  shoulderPress(name: 'Shoulder press'),
  deadlift(name: 'Deadlift'),
  squat(name: 'Squat');

  const Exercise({required this.name});
  final String name;
}
