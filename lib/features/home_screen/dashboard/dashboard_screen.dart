import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/workout_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: workouts.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final workout = data[index];
            return Card(
              child: ListTile(
                title: Text(workout['name']),
                subtitle: Text("Duration: ${workout['duration']} mins"),
                leading: const Icon(Icons.fitness_center, color: Colors.blueAccent),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
