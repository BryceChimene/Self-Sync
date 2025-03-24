import 'package:flutter/material.dart';

class ProgressionScreen extends StatelessWidget {
  const ProgressionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progression")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProgressCard("Workout Streak", "Current Streak: 7 Days", Icons.local_fire_department),
            _buildProgressCard("Weight Trend", "Last Entry: 170 lbs", Icons.monitor_weight),
            _buildProgressCard("Habit Completion", "5/7 Habits Completed", Icons.check_circle),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(String title, String subtitle, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
