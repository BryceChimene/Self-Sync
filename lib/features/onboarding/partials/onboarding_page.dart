import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key, 
    required this.image, 
    required this.title, 
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Lottie.asset(
            image,
            fit: BoxFit.fitWidth,
            ),
          ),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
