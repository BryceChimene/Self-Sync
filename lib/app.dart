import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:self_sync/features/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/auth/auth_screen.dart';
import 'providers/auth_provider.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<App> {
  bool? _showOnboarding;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _showOnboarding = !(prefs.getBool('onboardingComplete') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showOnboarding == null) {
      return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
    }

    final user = ref.watch(authStateProvider);
    final initialLocation = _showOnboarding! ? '/onboarding' : (user == null ? '/auth' : '/dashboard');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SelfSync',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      routerConfig: GoRouter(
        initialLocation: initialLocation,
        routes: [
          GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
          GoRoute(path: '/auth', builder: (_, __) => const AuthScreen()),
          GoRoute(path: '/dashboard', builder: (_, __) => const HomeScreen()),
        ],
      ),
    );
  }
}
