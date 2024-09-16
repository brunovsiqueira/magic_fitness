import 'package:isar/isar.dart';

@embedded
class SetModel {
  final String exercise;
  final double weight;
  final int repetitions;

  SetModel({
    required this.exercise,
    required this.weight,
    required this.repetitions,
  });
}
