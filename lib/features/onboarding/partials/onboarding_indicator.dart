import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/app_colors.dart';


class OnboardingIndicator extends StatelessWidget {
  final PageController controller;
  
  const OnboardingIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: const WormEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: AppColors.primary,
        ),
      ),
    );
  }
}
