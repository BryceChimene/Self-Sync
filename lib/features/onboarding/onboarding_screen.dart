import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    context.go('/auth'); // Navigate to Authentication screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          _buildPage(
            context,
            "Welcome to FitSocial",
            "Track workouts, nutrition, and connect with others.",
            "assets/images/onboarding1.png",
          ),
          _buildPage(
            context,
            "Stay Consistent",
            "Monitor your habits and see your progress over time.",
            "assets/images/onboarding2.png",
          ),
          _buildFinalPage(context),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, String title, String subtitle, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildFinalPage(BuildContext context) {
    return Column(
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
    );
  }
}
