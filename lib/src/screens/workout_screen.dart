import 'package:flutter/material.dart';
import 'package:magic_fitness/src/models/set_model.dart';
import 'package:magic_fitness/src/models/workout_model.dart';
import 'package:magic_fitness/src/routes.dart';

class WorkoutScreen extends StatelessWidget {
  WorkoutScreen({super.key, required this.workout});

  final WorkoutModel workout;

  List<SetModel> setList = [];

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
                itemCount: workout.sets.length,
                itemBuilder: (context, index) {
                  final set = workout.sets[index];
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bench press'),
                              Text('50 kg • 8 reps'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final SetModel? newSet =
                    await Navigator.pushNamed(context, AppRoutes.addSet)
                        as SetModel?;
                if (newSet != null) {}
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Add Set'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save workout logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Save Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
