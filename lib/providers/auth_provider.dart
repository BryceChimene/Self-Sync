import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Subabase client instance
final supabase = Supabase.instance.client;

// Auth state provider
final authStateProvider = StateProvider<User?>((ref) {
  return supabase.auth.currentUser;
});

// Auth controller for login and sign-up
final authControllerProvider = Provider((ref) => AuthController(ref));

class AuthController {
  final Ref ref;
  AuthController(this.ref);

  Future<String?> signUp(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(email: email, password: password);
      ref.read(authStateProvider.notifier).state = response.user;
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(email: email, password: password);
      ref.read(authStateProvider.notifier).state = response.user;
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    ref.read(authStateProvider.notifier).state = null;
  }
}