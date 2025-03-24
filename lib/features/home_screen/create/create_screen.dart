import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCreateButton("Create Workout", Icons.fitness_center, () {}),
            _buildCreateButton("Create Post", Icons.post_add, () {}),
            _buildCreateButton("Set Goal", Icons.flag, () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateButton(String title, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
    );
  }
}
