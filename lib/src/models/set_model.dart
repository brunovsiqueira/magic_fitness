import 'package:isar/isar.dart';

part 'set_model.g.dart';

@embedded
class SetModel {
  final String? exerciseName;
  final int? weight;
  final int? reps;

  // Constructor without required parameters
  SetModel({
    this.exerciseName,
    this.weight,
    this.reps,
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
