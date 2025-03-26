import 'package:flutter/material.dart';
import './partials/onboarding_page.dart';
import './partials/onboarding_indicator.dart';
import './partials/onboarding_skip.dart';

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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: const [
                    OnboardingPage(
                      image: "./lib/assets/lottie/lottie_1.json",
                      title: "Welcome to Self Sync",
                      subtitle: "Track workouts, nutrition, and connect with others.",
                    ),
                    OnboardingPage(
                      image: "./lib/assets/lottie/lottie_2.json",
                      title: "Stay Consistent",
                      subtitle: "Monitor your habits and see your progress over time.",
                    ),
                    OnboardingPage(
                      image: "./lib/assets/lottie/lottie_3.json",
                      title: "Get Started",
                      subtitle: "Let's create an account or log in to continue into Self Sync",
                    ),
                  ],
                ),
              ),
              OnboardingIndicator(controller: _pageController),
            ],
          ),
          OnboardingSkip(controller: _pageController),
        ],
      ),
    );
  }
}
