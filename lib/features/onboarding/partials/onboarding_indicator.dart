import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/app_colors.dart';

class OnboardingIndicator extends StatefulWidget {
  final PageController controller;

  const OnboardingIndicator({super.key, required this.controller});

  @override
  _OnboardingIndicatorState createState() => _OnboardingIndicatorState();
}

Future<void> _completeOnboarding(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboardingComplete', true);
  context.go('/auth'); // Navigate to Authentication screen
}

class _OnboardingIndicatorState extends State<OnboardingIndicator> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPage = widget.controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: widget.controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotHeight: 6,
              activeDotColor: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              if (currentPage < 2) {
                widget.controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                _completeOnboarding(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    currentPage == 2 ? 'Continue' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
