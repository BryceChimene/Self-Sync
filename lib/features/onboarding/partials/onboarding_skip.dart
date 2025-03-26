import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  final PageController controller;

  const OnboardingSkip({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 15),
        child: TextButton(
          onPressed: () {
            controller.animateToPage(
              2, // Last onboarding page
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent, // Change this based on your theme
            ),
          ),
        ),
      ),
    );
  }
}
