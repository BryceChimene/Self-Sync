import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/user_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: userProfile.when(
        data: (data) => Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(data['avatar_url'])),
            const SizedBox(height: 10),
            Text(data['username'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(data['bio'] ?? "No bio available"),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
