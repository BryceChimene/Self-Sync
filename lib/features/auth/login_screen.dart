import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/buttons/my_button.dart';
import './partials/login_partials/login_textfields.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    setState(() => _isLoading = true);
    final authController = ref.read(authControllerProvider);

    final error = await authController.signIn(_emailController.text, _passwordController.text);

    if (error != null) {
      setState(() => _errorMessage = error);
    } else {
      context.go('/dashboard'); // Navigate to dashboard on success
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "./lib/assets/images/logo.png",
                width: 200,
              ),
              const SizedBox(height: 50),

              LoginTextfields(emailController: _emailController, passwordController: _passwordController),
              
              if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 10),
              _isLoading
                ? const CircularProgressIndicator()
                : MyButton(buttonText: "LOGIN", function: _login),
              TextButton(
                onPressed: () => context.go('/signup'),
                child: const Text("Create an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
