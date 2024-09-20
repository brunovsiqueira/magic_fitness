import 'package:flutter/material.dart';
import 'package:magic_fitness/src/helpers/input_formatters.dart';
import 'package:magic_fitness/src/helpers/validator_helpers.dart';
import 'package:magic_fitness/src/models/set_model.dart';
import 'package:magic_fitness/src/widgets/add_set_button.dart';

class AddSetScreen extends StatefulWidget {
  const AddSetScreen({super.key});

  @override
  State<AddSetScreen> createState() => _AddSetScreenState();
}

class _AddSetScreenState extends State<AddSetScreen> {
  final _formKey = GlobalKey<FormState>();

  Exercise? _selectedExercise;
  final _weightController = TextEditingController();
  final _repetitionsController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _repetitionsController.dispose();
    super.dispose();
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Exercise',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<Exercise>(
                key: const Key('exercise_dropdown'),
                value: _selectedExercise,
                items: Exercise.values.map((exercise) {
                  return DropdownMenuItem<Exercise>(
                    value: exercise,
                    child: Text(exercise.name),
                  );
                }).toList(),
                onChanged: (Exercise? selectedValue) {
                  setState(() {
                    _selectedExercise = selectedValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select an exercise';
                  }
                  return null;
                },
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
                key: const Key('weight_field'),
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter weight',
                ),
                inputFormatters: [InputFormatters.twoDecimalPlacesFormatter],
                textInputAction: TextInputAction.next,
                validator: ValidationHelpers.validatePositiveDouble,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              const Text('Repetitions',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                key: const Key('reps_field'),
                controller: _repetitionsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter reps',
                ),
                textInputAction: TextInputAction.done,
                validator: ValidationHelpers.validatePositiveInteger,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onFieldSubmitted: (_) {
                  formSubmitted();
                },
              ),
              const Spacer(),
              AddSetButton(onPressed: formSubmitted)
            ],
          ),
        ),
      ),
    );
  }

  void formSubmitted() {
    if (_formKey.currentState!.validate()) {
      final newSet = SetModel(
        exercise: _selectedExercise!,
        weight: double.parse(_weightController.text),
        repetitions: int.parse(_repetitionsController.text),
      );

      Navigator.pop(context, newSet);
    }
  }
}
