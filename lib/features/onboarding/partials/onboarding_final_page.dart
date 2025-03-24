import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingFinalPage extends StatelessWidget {
  const OnboardingFinalPage({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    context.go('/auth'); // Navigate to Authentication screen
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Get Started", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text("Create an account or log in to continue.", textAlign: TextAlign.center),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => _completeOnboarding(context),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
