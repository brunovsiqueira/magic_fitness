import 'package:flutter/material.dart';

class AddSetScreen extends StatelessWidget {
  const AddSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Set'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Exercise',
                style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              items: [
                'Barbell row',
                'Bench press',
                'Shoulder press',
                'Deadlift',
                'Squat'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Weight (kg)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter weight',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Repetitions',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter reps',
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add set logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Add Set'),
            ),
          ],
        ),
      ),
    );
  }
}
