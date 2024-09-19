import 'package:flutter/material.dart';

class AddSetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddSetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Add Set',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
