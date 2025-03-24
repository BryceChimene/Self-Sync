import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final userProfileProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final user = supabase.auth.currentUser;
  if (user == null) return {};

  final response = await supabase.from('profiles').select('*').eq('id', user.id).single();
  return response;
});
