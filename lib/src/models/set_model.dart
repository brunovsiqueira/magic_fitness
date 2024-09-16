import 'package:isar/isar.dart';

part 'set_model.g.dart';

@collection
class SetModel {
  final Id id = Isar.autoIncrement;
  final String exercise;
  final double weight;
  final int repetitions;

  SetModel({
    required this.exercise,
    required this.weight,
    required this.repetitions,
  });
}
