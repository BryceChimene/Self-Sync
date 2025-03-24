import 'package:flutter/material.dart';
import './partials/onboarding_page.dart';
import './partials/onboarding_final_page.dart';
import './partials/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                OnboardingPage(
                  title: "Welcome to Self Sync",
                  subtitle: "Track workouts, nutrition, and connect with others.",
                ),
                OnboardingPage(
                  title: "Stay Consistent",
                  subtitle: "Monitor your habits and see your progress over time.",
                ),
                OnboardingFinalPage(),
              ],
            ),
          ),
          OnboardingIndicator(controller: _pageController),
        ],
      ),
    );
  }
}
