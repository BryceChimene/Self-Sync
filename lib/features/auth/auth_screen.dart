import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;
  String? _errorMessage;

  void _authenticate() async {
    setState(() => _isLoading = true);
    final authController = ref.read(authControllerProvider);
    
    String? error;
    if (_isLogin) {
      error = await authController.signIn(_emailController.text, _passwordController.text);
    } else {
      error = await authController.signUp(_emailController.text, _passwordController.text);
    }

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
              Text(_isLogin ? "Login" : "Sign Up", style: const TextStyle(fontSize: 24)),
              TextField(controller: _emailController, decoration: const InputDecoration(labelText: "Email")),
              TextField(controller: _passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
              if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 10),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(onPressed: _authenticate, child: Text(_isLogin ? "Login" : "Sign Up")),
              TextButton(
                onPressed: () => setState(() => _isLogin = !_isLogin),
                child: Text(_isLogin ? "Create an account" : "Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


