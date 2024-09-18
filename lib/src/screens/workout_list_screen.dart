import 'package:flutter/material.dart';
import 'package:magic_fitness/src/routes.dart';
import 'package:magic_fitness/src/screens/workout_screen.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Workouts',
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Example count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      title: Text('Workout ${index + 1}'),
                      subtitle: Text('5 sets • Sept ${10 + index}, 2024'),
                      trailing: const Icon(Icons.bar_chart, color: Colors.blue),
                      onTap: () {
                        //Navigator.pushNamed(context, AppRoutes.workoutDetails, arguments: );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const WorkoutScreen()),
          // );
        },
        label: const Text('New Workout'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
