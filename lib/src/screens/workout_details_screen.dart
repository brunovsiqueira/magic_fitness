// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:magic_fitness/src/models/set_model.dart';
import 'package:magic_fitness/src/models/workout_model.dart';
import 'package:magic_fitness/src/routes.dart';
import 'package:magic_fitness/src/widgets/add_set_button.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  final WorkoutModel? workout;

  WorkoutDetailsScreen({super.key, required this.workout});

  @override
  State<WorkoutDetailsScreen> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  late final WorkoutModel workout;

  @override
  void initState() {
    super.initState();

    workout = widget.workout ??
        WorkoutModel(date: DateTime.now().toUtc(), setList: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Workout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: workout.setList.length,
                itemBuilder: (context, index) {
                  final SetModel set = workout.setList[index];

                  return SetCardWidget(index: index, set: set);
                },
              ),
            ),
            const SizedBox(height: 16),
            AddSetButton(
              onPressed: () async {
                final SetModel? newSet =
                    await Navigator.pushNamed(context, AppRoutes.addSet)
                        as SetModel?;
                if (newSet != null) {
                  setState(() {
                    workout.setList = List.from(workout.setList)..add(newSet);
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, workout);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Save Workout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SetCardWidget extends StatelessWidget {
  const SetCardWidget({super.key, required this.index, required this.set});

  final int index;
  final SetModel set;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set ${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(set.exercise.name),
                Text('${set.weight} kg • ${set.repetitions} reps'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
